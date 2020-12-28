require_relative './controller'

class YearController < Controller
  def initialize(name)
    @site_file_name = name
    @year = Year.new(name)
  end
end

