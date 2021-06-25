require_relative './controller'
require 'pp'

class AuthorGuidesController < Controller
  def initialize(shelf)
    @site_file_name = "#{shelf}_author_guide"
    @author_guide = AuthorGuide.new(shelf)
  end
end

