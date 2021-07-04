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
        next if ratings.length == 0

        {
          name: author,
          avg_rating: (ratings.inject(:+) / ratings.length),
          count: ratings.length,
        }
      end
      .compact
      .select { |author_info| author_info[:avg_rating] >= 85 }
      .sort_by { |author_info| author_info[:avg_rating] }
      .reverse
  end

  def entries
    all_entries.select { _1["shelf"] == @shelf }
  end

  def all_entries
    YAML.load_file("#{__dir__}/../data.yml")["entries"]
  end
end

