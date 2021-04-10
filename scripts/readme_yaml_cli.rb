# frozen_string_literal: true

require "markdown-tables"
require "thor"
require "yaml" # bug with .to_yaml, need to require yaml first

class ReadmeYaml
  attr_reader :file_names, :table_data, :yaml_data

  def initialize
    @labels = %w[install repo description version]
    @file_names, @table_data = generate_table_data
    @yaml_data = generate_yaml_data
  end

  def parse_homebrew_file(filename)
    File.open(filename) do |f|
      rb_data = f.read
      description = rb_data.match(/desc \"(.*)\"/).captures.first
      version = rb_data.match(/version \"(.*)\"/).captures.first
      [description, version]
    end
  end

  def generate_table_data
    file_names = []
    table_data = Dir["*.rb"].map do |filepath|
      filename = File.basename(filepath, ".rb")
      file_names << filename
      [
        "`brew install conorsheehan1/conorsheehan1/#{filename}`",
        "https://github.com/ConorSheehan1/#{filename}",
        *parse_homebrew_file(filepath)
        # TODO: differentiate between linux brew installable files, mark in table
      ]
    end
    [file_names, table_data]
  end

  def generate_yaml_data
    @file_names.zip(@table_data).to_h do |k, v|
      [k, @labels.zip(v).to_h]
    end.to_yaml
  end

  def generate_readme_table
    MarkdownTables.make_table(@labels, @table_data, is_rows: true, align: "l")
  end
end

class Cli < Thor
  desc("write_yaml file_path (default=versions.yaml)", "write yaml file")
  def write_yaml_file(file_path = "versions.yaml")
    File.open(file_path, "w") do |file|
      file.puts(ReadmeYaml.new.yaml_data)
    end
    puts(set_color("Successfully wrote #{file_path}", :green))
  rescue StandardError
    puts(set_color("Failed to write #{file_path}", :red))
  end

  desc("update_readme file_path (default=README.md)", "update readme table")
  def update_readme_file(file_path = "README.md")
    readme_data = []
    File.open(file_path, "r") do |file|
      file.each_line do |line|
        break if line.include?("|install|repo|description|version|")

        readme_data << line
      end
    end
    File.open(file_path, "w") do |file|
      file.puts(readme_data)
      file.puts(ReadmeYaml.new.generate_readme_table)
    end
    puts(set_color("Successfully wrote #{file_path}", :green))
  rescue StandardError => e
    puts(set_color("Failed to write #{file_path}", :red))
    puts(set_color(e, :white))
  end

  desc("generate_table", "generate markdown table used in readme")
  def generate_table
    puts(ReadmeYaml.new.generate_readme_table)
  end
end

Cli.start(ARGV)
# bundle exec ruby scripts/readme_yaml_cli.rb