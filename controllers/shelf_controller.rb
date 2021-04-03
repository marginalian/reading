require_relative './controller'

class ShelfController < Controller
  def initialize(name)
    @site_file_name = name
    @shelf = Shelf.new(name)
  end
end

