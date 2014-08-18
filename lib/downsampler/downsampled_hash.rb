module Downsampler
  class DownsampledHash < DelegateClass(Hash)
    
    def mean &block
      inject({}) do |initial, (key, value)|
        result = value.dup.extend(EnumerableExt).mean(&block) if value.is_a?(Array)
        initial[key] = result
        initial
      end
    end

    def sum &block
      inject({}) do |initial, (key, value)|
        result = value.dup.extend(EnumerableExt).sum(&block) if value.is_a?(Array)
        initial[key] = result
        initial
      end
    end

    def counts
      inject({}) do |initial, (key, value)|
        initial[key] = values.count
        initial
      end
    end
  end
end
