class PartialStruct
  def initialize(hash)
    @hash = hash
  end

  def public_binding
    binding
  end

  private

  def method_missing(m, *args, &block)
    # no special puts formatting
    return if m == :to_ary

    if @hash[m]
      return @hash[m]
    end

    if Helpers::All.respond_to?(m)
      return Helpers::All.send(m, *args, &block)
    end

    raise "Partial could not find method: #{m}"
  end
end

