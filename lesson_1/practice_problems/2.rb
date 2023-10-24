# How does `count` treat the block's return value? How can we find out?
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

=begin
With a block given, `count` will return the number of elements for which 
the block returns a truthy value. You can find this information by searching
the Ruby docs.
=end