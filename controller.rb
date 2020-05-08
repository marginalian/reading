require 'erb'
require 'yaml'

Dir["#{__dir__}/models/*.rb"].each { |file| require file }

class Controller
  def initialize;end

  def call
    build_lists
  end

  private

  def build_lists
    prepped_entries = entries.map { |entry| entry.slice("read", "rating", "title", "author", "genre") }
    model = List.new(prepped_entries)
    view = File.read("./views/list.html.erb")
    render(view, model)
  end

  def render(view, model)
    html = ERB.new(view).result(model.get_binding)
    File.open("./site/list.html", "w") { _1.puts html }
  end

  def entries
    @entries ||= YAML.load_file("./data.yml")["entries"]
  end
end
