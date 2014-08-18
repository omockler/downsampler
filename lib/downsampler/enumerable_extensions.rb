module Downsampler
  module EnumerableExt
    def sum &block
      inject(0.0) do |result, el|
        el = yield(el) if block_given?
        result + el.to_f
      end
    end

    def mean &block
      sum(&block) / size
    end
  end
end
