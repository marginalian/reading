require_relative './mixins/type_bucketable.rb'

class Index
  include TypeBucketable

  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def count
    entries.length
  end

  def heat_map
    entries.map { _1["rating"] }.compact
  end
end
