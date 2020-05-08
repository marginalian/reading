class List
  def initialize(entries)
    @entries = entries
  end

  def header_cells
    entries.first.keys
  end

  def body_rows
    entries.map(&:values)
  end

  def get_binding
    binding
  end

  private

  attr_reader :entries
end
