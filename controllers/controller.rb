require 'erb'
require 'yaml'

Dir["#{__dir__}/../models/*.rb"].each do |file|
  require file
end

require_relative "../helpers/all.rb"
require_relative "../lib/partial_struct.rb"

class Controller
  def call
    render
  end

  def render_partial(path, partial_variables=nil)
    view_path = File.read("#{view_root}#{path}.html.erb")

    if partial_variables
      partial_binding = PartialStruct.new(partial_variables).public_binding
      ERB.new(view_path).result(partial_binding)
    else
      ERB.new(view_path).result(binding)
    end
  end

  def method_missing(m, *args, &block)
    if Helpers::All.respond_to?(m)
      Helpers::All.send(m, *args, &block)
    else
      raise "Controller could not find method: #{m}"
    end
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

