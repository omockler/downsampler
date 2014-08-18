# Downsampler

This gem is for downsampling and "bucketing" time based data. Great for passing data to [chartkick](https://github.com/ankane/chartkick)
```ruby
<%= line_chart User.downsample_by(60, :created_at).counts %> # 1 minute buckets
```
Implemented without any dependencies so you don't need activesupport or activerecord.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'downsampler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install downsampler

## Usage

```ruby
DataPoint = Struct.new(:time, :value)
data_points = (1..9).map { |i| DataPoint.new(Time.now + i*20, i)}

downsampled = data_points.downsample_by(1.minute, &:time)
#{
# 2014-08-18 15:01:00 -0400=>
#  [#<struct DataPoint time=2014-08-18 15:03:40 -0400, value=1>,
#   #<struct DataPoint time=2014-08-18 15:03:20 -0400, value=2>,
#   #<struct DataPoint time=2014-08-18 15:03:00 -0400, value=3>],
# 2014-08-18 15:02:00 -0400=>
#  [#<struct DataPoint time=2014-08-18 15:02:40 -0400, value=4>,
#   #<struct DataPoint time=2014-08-18 15:02:20 -0400, value=5>,
#   #<struct DataPoint time=2014-08-18 15:02:00 -0400, value=6>],
# 2014-08-18 15:03:00 -0400=>
#  [#<struct DataPoint time=2014-08-18 15:01:40 -0400, value=7>,
#   #<struct DataPoint time=2014-08-18 15:01:20 -0400, value=8>,
#   #<struct DataPoint time=2014-08-18 15:01:00 -0400, value=9>]
#}

downsampled.sum &:value
#{
# 2014-08-18 15:01:00 -0400=> 6,
# 2014-08-18 15:02:00 -0400=> 15,
# 2014-08-18 15:03:00 -0400=> 24
#}

downsampled.mean { |point| point.value }
#{
# 2014-08-18 15:01:00 -0400=> 2,
# 2014-08-18 15:02:00 -0400=> 5,
# 2014-08-18 15:03:00 -0400=> 8
#}

downsampled.counts
#{
# 2014-08-18 15:01:00 -0400=> 3,
# 2014-08-18 15:02:00 -0400=> 3,
# 2014-08-18 15:03:00 -0400=> 3
#}
```

## Contributing

1. Fork it ( https://github.com/omockler/downsampler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
