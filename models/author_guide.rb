require 'yaml'

class AuthorGuide
  def initialize(shelf)
    @shelf = shelf
  end

  def highest_rated_authors
    entries
      .group_by { |entry| entry["author"].strip }
      .map do |author, author_entries|
        ratings = author_entries.map { |entry| entry["rating"] }.compact
        next [author, 0] if ratings.length == 0

        avg_rating = ratings.inject(:+) / ratings.length
        [author, avg_rating]
      end
      .select { |name_and_rating| name_and_rating.last >= 85 }
      .sort_by { |name_and_rating| name_and_rating.last }
      .reverse
  end

  def entries
    all_entries.select { _1["shelf"] == @shelf }
  end

  def all_entries
    YAML.load_file("#{__dir__}/../data.yml")["entries"]
  end
end

