require 'erb'

class Table
  def initialize(entries)
    @entries = entries
  end

  def to_html
    ERB.new(template).result(binding)
  end

  private

  attr_reader :entries

  def template
    <<~TABLE
      <table>
        <tr>
        <% header_cells.each do |cell| %>
          <th> <%= cell %> </th>
        <% end %>
        </tr>
      <% body_rows.each do |row| %>
        <tr>
        <% row.each do |cell| %>
          <td> <%= cell %> </td>
        <% end %>
        </tr>
      <% end %>
      </table>
    TABLE
  end

  def header_cells
    entries.first.keys
  end

  def body_rows
    entries.map(&:values)
  end
end

