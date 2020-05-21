require_relative './controller'

class IndexController < Controller
  def initialize(entries)
    @site_file_name = "index"
    @entries = entries
  end
end
