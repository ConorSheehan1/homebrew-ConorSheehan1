# frozen_string_literal: true

# rubocop:disable Layout/LineLength

require "markdown-tables"

def generate_table
  labels = %w[install repo os]
  data = Dir["*.rb"].map do |filepath|
    filename = File.basename(filepath, ".rb")
    [
      "`brew install conorsheehan1/conorsheehan1/#{filename}`",
      "https://github.com/ConorSheehan1/#{filename}",
      "osx" # everything osx for now. TODO: differentiate between linux brew installable files
    ]
  end
  puts(MarkdownTables.make_table(labels, data, is_rows: true, align: "l"))
end

generate_table
# rubocop:enable Layout/LineLength
