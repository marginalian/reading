module Helpers
  class All
    def self.rating_class(rating)
      case rating
      when nil
        "rating-null"
      when 98..100
        "rating-98-100"
      when 90..97
        "rating-90-97"
      when 80..89
        "rating-80-89"
      when 70..79
        "rating-70-79"
      when 0..69
        "rating-0-69"
      else
        ""
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

