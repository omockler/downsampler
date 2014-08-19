module Enumerable
  def downsample_by secs, &block
    downsampled_hash = group_by do |value|
      time = yield value
      time = Time.parse(time) unless time.is_a?(Time)
      time = time.dup.extend(Downsampler::TimeExt)
      time.floor(secs)
    end
    Downsampler::DownsampledHash.new(downsampled_hash)
  end
end
