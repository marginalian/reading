require 'erb'
require 'yaml'

Dir["#{__dir__}/../models/*.rb"].each do |file|
  require file
end

class Controller
  def call
    render
  end

  def render_partial(path)
    view_path = File.read("#{view_root}#{path}.html.erb")
    ERB.new(view_path).result(binding)
  end

  private

  def view_root
    "#{__dir__}/../views/"
  end

  def html
    ERB.new(view).result(binding)
  end

  def render
    File.open("./site/#{@site_file_name}.html", "w") { _1.puts html }
  end

  def view
    File.read("./views/#{type}.html.erb")
  end

  def type
    self.class.name.gsub("Controller", "").downcase
  end
end

