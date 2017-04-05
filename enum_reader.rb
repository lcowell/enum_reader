class EnumReader
  attr_reader :pos

  def initialize(enum)
    @enum = enum
    @pos = 0
    @buff = ""
  end

  def read(num)
    while buff && buff.length < num
      begin
        d = enum.next
      rescue StopIteration
        break
      end
      buff << d
    end

    if buff
      @pos += [num, buff.length].min

      result = buff[0, num] # will extract as many bytes as are available
      @buff = buff[num..-1] # could set @buff to nil

      # we happened to create an empty buffer. We're done.
      if result.length == 0
        @buff = nil
        nil
      else
        result
      end
    else
      nil
    end
  end

  def size
    0
  end

  def close
    true
  end

  def rewind
    raise
  end

  private

  attr_reader :enum, :buff
end
