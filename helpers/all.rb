module Helpers
  class All
    def self.rating_group(rating)
      case rating
      when nil
        "n-a"
      when 98..100
        "98-100"
      when 90..97
        "90-97"
      when 80..89
        "80-89"
      when 70..79
        "70-79"
      when 0..69
        "0-69"
      else
        "n-a"
      end
    end

    def self.pluralize(word)
      if word.chars.last == "y" && !%w[a e i o u].include?(word.chars[-2])
        word.dup.gsub(/y$/, 'ies')
      else
        word.dup.concat("s")
      end
    end
  end
end

