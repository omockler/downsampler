require 'spec_helper'

describe Downsampler do
  let(:data) { generate_enumerable }
  let(:downsampled_data) { data.downsample_by(60, &:time) }    

  it "should add downsample_by method" do
    expect([]).to respond_to :downsample_by
  end

  describe ".downsample_by" do
    
    it "should return a downsampled hash" do
      expect(downsampled_data).to be_a(Downsampler::DownsampledHash)
    end

    it "should generate the correct group keys" do
      sorted_keys = downsampled_data.keys.sort
      first_time = sorted_keys.first
      generated_keys = sorted_keys.size.times.map do |i|
        first_time + i*60
      end
      expect(generated_keys == sorted_keys).to be true
    end

    it "should create 3 groups for the 9 datapoints" do
      expect(downsampled_data.count).to eq(3)
    end

    it "should disribute the groups correctly" do
      downsampled_data.each_pair do |key, values|
        expect(
          (values.first.time + 60) > values.last.time
        ).to be true
      end
    end

  end

  describe ".sum" do
    let(:first_key) { downsampled_data.keys.first }
    let(:summed) { downsampled_data.sum(&:value) }
    
    it "should correctly sum each group" do
      #first group should have the values [1,2,3]
      expect(summed[first_key]).to eq 6
    end

    it "should leak sum method to original array" do
      summed
      expect(downsampled_data[first_key]).not_to respond_to :sum
    end
  end

  describe ".mean" do
    let(:first_key) { downsampled_data.keys.first }
    let(:meaned) { downsampled_data.mean(&:value) }
    
    it "should correctly average each group" do
      expect(meaned[first_key]).to eq 2
    end

    it "should not leak mean method to original array" do
      meaned
      expect(downsampled_data[first_key]).not_to respond_to :mean
    end
  end

end