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
end

