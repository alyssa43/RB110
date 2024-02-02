<h1>RB119 Study Guide</h1>

- `String` and `Array` operations: indexing, range indexing (slicing), negative indexes, assigning elements

  - `Array` - Because an `Array` is an ordered list, each element within the 'list' can be accessed by it's index, or where it is located in the 'list'. The first element within an `Array` will be at the `0` index, then the next element will be at index `1`, then the next element will be at index `2` and so on. To access a specific indexed element within an `Array` you can simply use the `Array#[]` method (or `Array#slice` which is an alias for the former). EX:

    ```ruby
    arr = [1, 2, 3, 4, 5]
    arr[0] # => 1
    arr[1] # => 2
    arr.slice(0) # => 1
    arr.slice(1) # => 2
    ```

    To access multiple elements within an `Array` we can use range indexing. When using a range the first `Integer` represents the index of the element you want to start at, and the second `Integer` represents the index of the element you want to end at.  EX:

    ```ruby
    arr[0..2] # => [1, 2, 3]
    ```

    We can also access multiple elements within an `Array` by using the `Array#[]` method with two `Integers` as the arguments. The first `Integer` represents the index of the first element you want to return. The second `Integer` represents the amount of elements you want to return. EX:

    ```ruby
    arr[0, 2] # => [1, 2]
    ```

    We can also access elements with negative indexes. If we have an `Array` and want to access the last element in the 'list' but do not know how many items are on the 'list', we can reference that last element with a `-1` index. Then to access the second to last item would be `-2` and so on. EX:

    ```ruby
    arr[-1] # => 5
    arr[-2] # => 4
    arr[-3] # => 3
    ```

    We can also assign elements to an `Array` by using the `Array#[]=` method. Note that reassignment using this method will mutate the original `Array`. EX:

    ```ruby
    arr[2] = 'x'
    arr # => [1, 2, 'x', 4, 5]
    ```

  - `String` - When using indexing with a `String`, the characters of the string will essentially be transformed into an `Array` as if calling `String#chars` on the `String`. Which means that we can access each character of the `String` by treating it as an `Array` where each character is an element inside the `Array`.

- `Hash` operations: indexing, string and symbol keys

  - Because a `Hash` is not an ordered list (like an `Array`) rather it is a collection with  `key` , `value` pair(s), we can use the `key` as the index to access the `value`. A `key` is most commonly going to be a `symbol`, however it can be any object. To access the `value` by using the `key` as the index we can use the `Hash#[]` method, where we use the `Hash` variable name followed by `[]`containing the `key` you would like to access. EX:

    ```ruby
    hsh = {key_1: 'value 1', key_2: 'value 2'}
    hsh[:key_1] # => 'value 1'
    hsh[:key_2] # => 'value 2'
    ```

    We can also reassign a `key`'s `value` by using the `Hash#[]=` (or `Hash#store` method which is an alias for the former). When using this method, the `key` that is within the `[]` , will now have the object to the right of the `=` as it's `value`. If there is no `key` that matches what is within the `[]`, then it will add that `key` as well as the `value` to the `Hash`. EX:

    ```ruby
    hsh[:key_1] = 'new value 1'
    hsh # => {:key_1=>'new value 1', :key_2=>'value 2'}
    hsh[:key_3] = 'value 3'
    hsh # => {:key_1=>'new value 1', :key_2=>'value 2', :key_3=>'value 3'}
    ```

- `String` methods: `chars`, `concat`, `count`, `downcase`, `downcase!`, `freeze`, `include?`, `replace`, `reverse`, `reverse!`, `size`, `slice`, `slice!`, `split`, `strip`, `strip!`, `upcase`, `upcase!`

  - `String#chars` - returns a new `Array` object containing each character of the calling `String`.
  - `String#concat` - returns the same `String` object *mutated* by adding on the object(s) passed in as the argument, to the end of the calling `String`.
  - `String#count` - returns an `Integer`, which is equal to the number of instances the argument passed to it occurs within the calling `String`. Can accept multiple arguments.
  - `String#downcase` - returns a new `String` object that contains all of the characters of the calling `String` in lowercase.
  - `String#downcase!` - returns the same `String` object *mutated* by making all the characters of the calling `String` lowercase. If called on a `String` with all lowercase characters than `nil` is returned.
  - `Object#freeze` - When called on a `String` object, it prevents that `String` from being mutated.
  - `String#include?` - returns a `Boolean`; if the calling `String` contains the `String` that is passed in as the argument `true` is returned. Otherwise `false` is returned.
  - `String#replace` - returns the same `String` object  *mutated* by replacing the calling `String` with the `String` passed to it as the argument.
  - `String#reverse` - returns a new `String` object that contains the characters from the calling `String` in reversed order.
  - `String#reverse!` - returns the same `String` object *mutated* by reversing all the characters of the calling `String`.
  - `String#size` - returns an `Integer` that is equal to the number of characters within the calling `String`. (An alias for `String#length`)
  - `String#slice` - An alias for `String#[]`. Returns a new `String` object copied from the calling `String`.
  - `String#slice!` - returns the same `String` object *mutated* with a slice removed.
  - `String#split` - returns an `Array` of substrings from the calling `String` object. When no argument is used the substrings are split by spaces.
  - `String#strip` - returns a new `String` object that contains the calling `String` with leading and trailing whitespace removed.
  - `String#strip!` - returns the same `String` object *mutated* by removing the leading and trailing whitespace from the calling `String`.
  - `String#upcase` - returns a new `String` object that contains all of the characters of the calling `String` in uppercase.
  - `String#upcase!` - returns the same `String` object *mutated* by making all the characters of the calling `String` uppercase. If called on a `String` with all uppercase characters than `nil` is returned.

- `Array` methods: `all?`, `any?`, `each`, `each_with_index`, `each_with_object`, `fetch`, `first`, `include?`, `join`, `last`, `map`, `map!`, `partition`, `pop`, `push`, `reverse`, `reverse!`, `select`, `select!`, `shift`, `slice`, `slice!`, `sort`, `sort!`, `unshift`

  - `Array#all?` - returns a `Boolean`. If *all* of the element's within the calling `Array` meet the specifications within the block `true` is returned; otherwise `false` is returned.
  - `Array#any?` - returns a `Boolean`. If at least *one* element within the calling `Array` meets the specifications within the block `true` is returned; otherwise `false` is returned.
  - `Array#each` - An iterative method that passes each element within the calling `Array` into the block to be used in some way. Returns the original calling `Array`.
  - `Enumerable#each_with_index` - An iterative method that passes each element within the calling `Array`, as well as it's index into the block to be used in some way. Returns the original calling `Array`.
  - `Enumerable#each_with_object` - An iterative method that passes each element within the calling `Array`, as well as an `Object` to be used (such as another `Array` or a `Hash`). The object passed in as the argument is what will be returned.
  - `Array#fetch`- returns the element located at the index that is passed in as the argument.
  - `Array#first` - returns the `0` indexed element when called with no argument. When called with an `Integer` as the argument, returns the first `n` amount of elements within calling `Array`.
  - `Array#include?` - returns a `Boolean`. If the calling `Array` contains the object passed in as the argument `true` is returned; otherwise `false` is returned.
  -  `Array#join` - returns a new `String` object that is all of the elements of the calling `Array` combined together. Can accept a `String` as the argument which will be used as the seperator.
  - `Array#last` - returns the `-1` indexed element when called with no argument. When called with an `Integer` as the argument, returns the last `n` amount of elements within the calling `Array`.
  -  `Array#map` - returns a new `Array` that contains transformed elements from the calling `Array` . The element will be transformed based on the return value from within the block on each iteration.
  - `Array#map!` - returns the same `Array` that has been *mutated* to contain the transformed elements based on the return value from within the block on each elements iteration. 
  - `Enumberable#partition` - returns a nested `Array` that contains two subarrays based upon the block's return value.
  -  `Array#pop` - returns 
  -  `Array#push`,
  -  `Array#reverse`,
  -  `Array#reverse!`,
  -  `Array#select`,
  -  `Array#select!`, 
  - `Array#shift`,
  -  `Array#slice`, 
  - `Array#slice!`, 
  - `Array#sort`,
  -  `Array#sort!`, 
  - `Array#unshift`

- `Hash` methods: `all?`, `any?`, `each_key`, `each_value`, `empty?`, `include?`, `key`, `key?`, `keys`, `map`, `select`, `select!`, `value?`, `values`

- `Integer` methods: `times`

- iteration, `break` and `next`

- selection and transformation

- nested data structures and nested iteration

- shallow copy and deep copy

- method chaining