module Downsampler
  module TimeExt
    def floor(seconds = 60)
      Time.at((self.to_f / seconds).floor * seconds)
    end
  end
end