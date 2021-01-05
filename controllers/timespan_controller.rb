require_relative './controller'

class TimespanController < Controller
  def initialize(name)
    @site_file_name = name
    @timespan = Timespan.new(name)
  end
end

