require 'yaml'

class Genre
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def count
    entries.length
  end

  def percentage
    ((count.to_f / all_entries.length.to_f) * 100).to_i
  end

  def hundos
    entries.select { _1["rating"] == 100 }.map { _1.slice("title", "author", "type") }
  end

  def type_percentages
    entries
      .map { _1["type"] }
      .group_by(&:itself)
      .transform_keys! { _1.ljust(longest_type).gsub("\s", "&nbsp;") }
      .transform_values!(&:size)
      .transform_values!(&calc_pct)
      .sort_by { _2 }
      .reverse
  end

  def calc_pct
    -> (i) { ((i.to_f / entries.length.to_f) * 100).to_i }
  end

  private

  def longest_type
    entries.map { _1["type"] }.map(&:length).max
  end

  def entries
    all_entries.select { _1["genre"] == name }
  end

  def all_entries
    YAML.load_file("#{__dir__}/../data.yml")["entries"]
  end
end
