require_relative './controller'
require_relative '../models/index'

class IndexController < Controller
  def initialize(entries)
    @site_file_name = "index"
    @index = Index.new(entries)
  end
end
