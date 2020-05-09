require_relative './controller'

class GenreController < Controller
  def initialize(name)
    @site_file_name = name
    @genre = Genre.new(name)
  end
end
