require 'yaml'
require 'ostruct'

class Validator
  attr_reader :errors

  def initialize(entries_path)
    @entries = YAML.load_file(entries_path)["entries"]
    @errors = []
  end

  def run
    validate
  end

  def count
    entries.length
  end

  def valid?
    !errors.length.positive?
  end

  private

  attr_reader :entries

  def key_whitelist
    %w(
      id
      read
      title
      author
      genre
      fiction
      rating
      published
      collection
      type
      format
      link
      tags
    )
  end

  def allowable_types
    %w(
      book
      essay
      article
      novel
      novella
      novelette
      short_story
      flash_fiction
    )
  end

  def validate
    entries.each do |entry|
      if entry.keys != key_whitelist
        errors << "Invalid keys detected for #{entry["id"]}"
      end

      unless allowable_types.include?(entry["type"])
        errors << "Invalid type for #{entry["id"]}"
      end
    end
  end
end

