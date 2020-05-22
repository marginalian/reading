module TypeBucketable
  def type_percentages
    entries
      .map { _1["type"] }
      .group_by(&:itself)
      .transform_keys! { _1.gsub("_", "\s") }
      .transform_values!(&:size)
      .transform_values!(&calc_pct)
      .sort_by { _2 }
      .reverse
  end

  def calc_pct
    -> (i) { ((i.to_f / entries.length.to_f) * 100).round }
  end
end

