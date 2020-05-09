require_relative './controller'

class ListController < Controller
  def initialize(entries, site_file_name="list")
    @site_file_name = site_file_name
    @list = List.new(entries)
  end
end
