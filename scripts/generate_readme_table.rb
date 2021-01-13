# frozen_string_literal: true

require "markdown-tables"

def parse_homebrew_file(filename)
  File.open(filename) do |f|
    data = f.read
    description = data.match(/desc \"(.*)\"/).captures.first
    version = data.match(/version \"(.*)\"/).captures.first
    [description, version]
  end
end

def generate_table
  labels = %w[install repo description version]
  data = Dir["*.rb"].map do |filepath|
    filename = File.basename(filepath, ".rb")
    [
      "`brew install conorsheehan1/conorsheehan1/#{filename}`",
      "https://github.com/ConorSheehan1/#{filename}",
      *parse_homebrew_file(filepath)
      # TODO: differentiate between linux brew installable files, mark in table
    ]
  end
  puts(MarkdownTables.make_table(labels, data, is_rows: true, align: "l"))
end

generate_table
# bundle exec ruby scripts/generate_readme_table.rb
