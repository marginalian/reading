class List
  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def header_cells
    entries.first.keys
  end
end

