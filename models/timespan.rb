require 'yaml'
require_relative './mixins/type_bucketable.rb'

class Timespan
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

  def hundos
    entries.select { |e| e["rating"] == 100 }.length
  end

  def entries
    @entries ||= begin
      length = name.length - 1
      all_entries.select { _1["read"].to_s[0..length] == name }
    end
  end

  def entries_by_rating
    entries
      .uniq { _1["title"].to_s + _1["author"] }
      .sort_by { _1["rating"] || 0 }.reverse
  end

  def all_entries
    @all_entries ||= YAML.load_file("#{__dir__}/../data.yml")["entries"]
  end
end

