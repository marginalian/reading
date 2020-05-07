require_relative '../lib/table.rb'

class Report
  def initialize(entries)
    @entries = entries
  end

  def to_s
    <<~TABLE
      #{hundos}
    TABLE
  end

  private

  attr_reader :entries

  def hundos
    hundo_entries = entries.select { _1["rating"] == 100 }
    Table.new(hundo_entries.map { _1.slice("title", "author", "type") }).to_s
  end

  def header_string
    header.each_with_index.map { |cell, i| cell.ljust(cell_lengths[i]) }.join(" │ ").prepend("║ ").concat(" ║")
  end

  def rows_string
    rows.map do |row|
      row.each_with_index.map { |cell, i| cell.ljust(cell_lengths[i]) }.join(" │ ").prepend("║ ").concat(" ║")
    end.join("\n")
  end

  def rows
    entries.map do |entry|
      entry.values.map do |cell|
        case cell
        when Date
          cell.to_s
        when TrueClass
          "yes"
        when FalseClass
          "no"
        when NilClass
          ""
        when Array
          cell.join(", ")
        else
          cell.to_s
        end
      end
    end
  end

  def header
    entries.first.keys
  end


  def cell_lengths
    (0..(header.size - 1)).map do |col|
      rows_max = rows.map { |row| row[col].size }.max
      [rows_max, header[col].size].max
    end
  end

  def top_line
    cell_lengths.map { |i| "═" * i }.join("═╤═").prepend("╔═").concat("═╗")
  end

  def middle_line
    cell_lengths.map { |i| "─" * i }.join("─┼─").prepend("╟─").concat("─╢")
  end

  def bottom_line
    cell_lengths.map { |i| "═" * i }.join("═╧═").prepend("╚═").concat("═╝")
  end
end

