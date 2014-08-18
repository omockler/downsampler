require 'pry'
require 'downsampler'

DataPoint = Struct.new :name, :time, :value

def generate_enumerable
  time = Time.at((Time.now.to_f / 60).floor * 60) # Emulate Time.floor
  
  (1..9).map do |i|
    DataPoint.new("Point #{i}", (time - i*20), i)
  end
end
