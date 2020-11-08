require 'yaml'
require_relative './mixins/type_bucketable.rb'

class Genre
  include TypeBucketable

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

  def entries
    all_entries.select { _1["genre"] == name }
  end

  def entries_by_rating
    entries
      .uniq { _1["title"].to_s + _1["author"] }
      .sort_by { _1["rating"] || 0 }.reverse
  end

  def all_entries
    YAML.load_file("#{__dir__}/../data.yml")["entries"]
  end
end

