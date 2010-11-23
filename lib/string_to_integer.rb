raise "StringToInt#to_int only works on ruby >= 1.8.7" if RUBY_VERSION < '1.8.7'

# Yeah, you can just use #to_i...but I wanted to try out writing my own logic :).
# Either include it in all String instances:
#   String.send(:include, StringToInteger)
#
# ...or extend a single string instance
# k = "12312"; k.extend(StringToInteger)
module StringToInteger
  ZERO_BYTE_VALUE = "0".bytes.first

  def to_integer
    number_part = case self
      when /\A\-(\d+)\z/
        multiplier = -1
        $1
      when /\A\d+\z/
        self
      else
        raise ArgumentError.new("The given string ('#{self}') cannot be converted to an integer.")
    end

    int = number_part.reverse.each_byte.with_index.inject(0) do |memo, (byte, index)|
      memo += (byte - ZERO_BYTE_VALUE) * (10 ** index)
    end

   int *= multiplier if multiplier
   int
  end
end
