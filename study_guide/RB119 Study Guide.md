<h1>RB119 Study Guide</h1>

- `String` and `Array` operations: indexing, range indexing (slicing), negative indexes, assigning elements:

  - `Array` - Because an `Array` is an ordered list, each element within the 'list' can be accessed by its index, or where it is located in the 'list'. The first element within an `Array` will be at the `0` index, then the next element will be at index `1`, then the next element will be at index `2` and so on. To access a specific indexed element within an `Array` you can simply use the `Array#[]` method (or `Array#slice` which is an alias for the former). You simply put the index of the element you wish to access within the brackets (or parentheses for `Array#slice`) EX:

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

    Notes about `Array#slice` - 

    	* if `index` is out of range, returns `nil`
    	* If `start + length` is greater than `arr.length`, returns all elements from `start` to the end of the calling `arr`
    	* If `length` is negative, returns `nil`
    	* If `start == arr.size` AND `length >= 0`, returns a new empty `Array`.
    	* If `range.start == arr.size`, returns a new empty `Array`
    	* If `range.end` is negative, calculates the end index from the end
    	* If `range.start` is negative, calculates the start index from the end
    	* If `range.start > arr.size`, returns `nil`

  - `String` - When using indexing with a `String`, the characters of the string will essentially be transformed into an `Array` as if calling `String#chars` on the `String`. Which means that we can access each character of the `String` by treating it as an `Array` where each character is an element inside the `Array`.

- `Hash` operations: indexing, string and symbol keys

  - Because a `Hash` is not an ordered list (like an `Array`) rather it is a collection with  `key` , `value` pair(s), we can use the `key` as the index to access the `value`. A `key` is most commonly going to be a `symbol`, however it can be any object. To access the `value` by using the `key` as the index we can use the `Hash#[]` method, where we use the `Hash` variable name followed by `[]`containing the `key`  you would like to access inside the brackets. EX:

    ```ruby
    hsh = {key_1: 'value 1', key_2: 'value 2'}
    hsh[:key_1] # => 'value 1'
    hsh[:key_2] # => 'value 2'
    ```

    We can also reassign a `key`'s `value` by using the `Hash#[]=` (or `Hash#store` method which is an alias for the former). When using this method, the `key` that is within the brackets will now have the object to the right of the `=` as it's `value`. If there is no `key` that matches what is within the brackets, then it will add that `key` as well as the `value` to the `Hash`. EX:

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
  - `Object#freeze` - when called on a `String` object, it prevents that `String` from being mutated.
  - `String#include?` - returns a `Boolean`; if the calling `String` contains the `String` that is passed in as the argument `true` is returned. Otherwise `false` is returned.
  - `String#replace` - returns the same `String` object  *mutated* by replacing the calling `String` with the `String` passed to it as the argument.
  - `String#reverse` - returns a new `String` object that contains the characters from the calling `String` in reversed order.
  - `String#reverse!` - returns the same `String` object *mutated* by reversing all the characters of the calling `String`.
  - `String#size` - returns an `Integer` that is equal to the number of characters within the calling `String`. (An alias for `String#length`)
  - `String#slice` - an alias for `String#[]`. Returns a new `String` object copied from the calling `String`.
  - `String#slice!` - returns the same `String` object *mutated* with a slice removed.
  - `String#split` - returns an `Array` of substrings from the calling `String` object. When no argument is used the substrings are split by spaces.
  - `String#strip` - returns a new `String` object that contains the calling `String` with leading and trailing whitespace removed.
  - `String#strip!` - returns the same `String` object *mutated* by removing the leading and trailing whitespace from the calling `String`.
  - `String#upcase` - returns a new `String` object that contains all of the characters of the calling `String` in uppercase.
  - `String#upcase!` - returns the same `String` object *mutated* by making all the characters of the calling `String` uppercase. If called on a `String` with all uppercase characters than `nil` is returned.

- `Array` methods: `all?`, `any?`, `each`, `each_with_index`, `each_with_object`, `fetch`, `first`, `include?`, `join`, `last`, `map`, `map!`, `partition`, `pop`, `push`, `reverse`, `reverse!`, `select`, `select!`, `shift`, `slice`, `slice!`, `sort`, `sort!`, `unshift`

  - `Array#all?` - returns a `Boolean`. If *all* of the element's within the calling `Array` meet the specifications within the block `true` is returned; otherwise `false` is returned. When called with no argument and no block, returns `true` is the calling `Array` contains only truthy elements; `false` otherwise. When called with an `object` as the argument, returns `true` if `object` is `===` to every element; `false` otherwise (EX: `[0,0,0].all?(0) #=> true`, `[0,1,2].all?(0) #=> false`)
  - `Array#any?` - returns a `Boolean`. If at least *one* element within the calling `Array` meets the specifications within the block `true` is returned; otherwise `false` is returned. When called with no argument and no block, returns `true` if calling `Array` has any truthy element; `false` otherwise. When called with an `object` as the argument, returns `true` if `object` is `===` to any element; `false` otherwise (EX:`[nil,0].any? #=> true` , `[0,1,2].any?(1) #=> true`)
  - `Array#each` - an iterative method that passes each element within the calling `Array` into the block to be used in some way. Returns the original calling `Array`.
  - `Enumerable#each_with_index` - an iterative method that passes each element within the calling `Array`, as well as it's index into the block to be used in some way. Returns the original calling `Array`.
  - `Enumerable#each_with_object` - An iterative method that passes each element within the calling `Array`, as well as an `Object` to be used (such as another `Array` or a `Hash`). The object passed in as the argument is what will be returned.
  - `Array#fetch`- returns the element located at the index that is passed in as the argument.
  - `Array#first` - returns the `0` indexed element when called with no argument. When called with an `Integer` as the argument, returns the first `n` amount of elements within calling `Array`.
  - `Array#include?` - returns a `Boolean`. If the calling `Array` contains the object passed in as the argument `true` is returned; otherwise `false` is returned.
  -  `Array#join` - returns a new `String` object that is all of the elements of the calling `Array` combined together. Can accept a `String` as the argument which will be used as the seperator.
  - `Array#last` - returns the `-1` indexed element when called with no argument. When called with an `Integer` as the argument, returns the last `n` amount of elements within the calling `Array`.
  -  `Array#map` - returns a new `Array` that contains transformed elements from the calling `Array` . The element will be transformed based on the return value from within the block on each iteration.
  - `Array#map!` - returns the same `Array` that has been *mutated* to contain the transformed elements based on the return value from within the block on each elements iteration. 
  - `Enumberable#partition` - returns a nested `Array` that contains two subarrays based upon the block's return value.
  -  `Array#pop` - returns *and removes* the trailing element(s) of the calling `Array`. Can accept an `Integer` as the argument. When no argument is given, it will return and remove the last element within the `Array`. When an argument (`n`) is given, `n` amount of elements will be removed from the end of the `Array` and returned within a new `Array` object. *This is a mutating method call*.
  -  `Array#push` - can accept multiple arguments. Each argument is appended to the end of the calling `Array` as one element for each argument. The mutated `Array` is then returned. *This is a mutating method call*. (An alias for `Array#append`)
  -  `Array#reverse` - returns a new `Array` object with the elements of the calling `Array` in reversed order.
  -  `Array#reverse!` - returns the same `Array` object that has been *mutated* to contain the elements of the calling `Array` in reversed order.
  -  `Array#select` - an iterative method that passes each element within the calling `Array` into the block, which then returns a new `Array` that contains *only* the elements that have returned a truthy value from within the block. (An alias for `Array#filter`)
  -  `Array#select!` - an iterative method that passes each element within the calling `Array` into the block, which then returns the same *mutated* `Array` object containing only the elements that have returned a truthy value from within the block. (An alias for `Array#filter!`)
  - `Array#shift` - returns *and removes* the leading element(s) of the calling `Array`. Can accept an `Integer` as the argument. When no argument is given, it will return and remove the first element within the `Array`. When an argument (`n`) is given, `n` amount of elements will be removed from the beginning of the `Array` and returned within a new `Array` object. *This is a mutating method call*.
  -  `Array#slice` - used to retrieve element(s) from within the calling `Array`. When called with a single `Integer`, the element at the index will be returned. When called with two `Integer`'s representing a start and length (`arr.slice(0, 2)`) a new `Array` object will be returned containing the elements at the respective indexes. When called with a `range` (`arr.slice(0..2)`) a new `Array` object will be returned containing the elements at the respective indexes. ( An alias for `Array#[]`)
  - `Array#slice!` - used to retrieve *and remove* element(s) from within the calling `Array`. When called with a single `Integer`, the element at the index will be removed from the calling `Array` and returned. When called with two `Integer`'s representing a start and length (`arr.slice(0, 2)`) a new `Array` object will be returned containing the events at the respective indexes, and those elements will be removed from the calling `Array`. When called with `range` (`arr.slice(0..2)`) a new Array object will be returned containing the elements at the respective indexes, and those elements will be removed from the calling `Array`. *This is a mutating method call*.
  - `Array#sort` - returns a new `Array` object that contains the elements from the calling `Array` that have been sorted. All elements within the calling `Array` must be able to be compared with each other. When called with no block, it compares elements using the `<=>` operator. When called with a block, the block needs two arguments passed to it, which will be the elements to be compared; and the return value of the block must be `-1`, `0`, `1`, or `nil`.
  - `Array#sort!` - returns the same `Array` object that has been *mutated* to contain the elements of the calling `Array` is a sorted order. All elements within the calling `Array` must be able to be compared with each other. When called with no block, it compares elements using the `<=>` operator. When called with a block, the block needs two arguments passed to it, which will be the elements to be compared; and the return value of the block must be `-1`, `0`, `1`, or `nil`. *This is a mutating method call*.
  - `Array#unshift` - can accept multiple arguments. Each argument is prepended to the beginning of the calling `Array` as one element for each argument. The mutated `Array` is then returned. *This is a mutating method call*. (An alias for `Array#prepend`)

- `Hash` methods: `all?`, `any?`, `each_key`, `each_value`, `empty?`, `include?`, `key`, `key?`, `keys`, `map`, `select`, `select!`, `value?`, `values`

  - `Enumberable#all?` - returns a `Boolean`. If *all* of the element's within the calling object meet the specifications within the block `true` is returned; otherwise `false` is returned. When called with no argument and no block, returns `true` if every element is truthy; otherwise `false`. When called with a `pattern` as the argument, and no block, returns `true` if for each `element`, `pattern === element`; `false` otherwise. 
  - `Hash#any?` - returns a `Boolean`. If at least *one* element within the calling `Hash` meets the specifications within the block `true` is returned; otherwise `false` is returned. If called with no argument and no block, returns `true` is calling `Hash` is non-empty; `false` if empty. When called with an `object` (`Array` containing `key` and `value`) as the argument and no block, returns `true` if there is any `key` `value` pair that matches the argument; `false` otherwise.
  - `Hash#each_key` -  an iterative method that passes each `key` within the calling `Hash` into the block to be used in some way. Returns the original calling `Hash`.
  -  `Hash#each_value` - an iterative method that passes each `value` within the calling `Hash` into the block to be used in some way. Returns the original calling `Hash`.
  -  `Hash#empty?` - returns a `Boolean`. Returns `true` if there are no `Hash` entries; `false` otherwise.
  -  `include?` - returns a `Boolean`. Accepts one single argument that represents a `key` (`hash.include?(key)`), returns `true` if `key` exists within the calling `Hash`; other `false`. (An alias for `Hash#has_key?`, `Hash#key?`, and `Hash#member`).
  - `Hash#key` - accepts a `value` as the argument (`hash.key(value)`), returns the `key` for the first-found entry with the given `value`. Returns `nil` if no such `value` is found.
  - `Hash#key?` -  returns a `Boolean`. Accepts one single argument that represents a `key`, returns `true` if `key` exists within the calling `Hash`; otherwise `false`. (An alias for `Hash#has_key?`, `Hash#include?`, and `Hash#member`).
  - `Hash#keys` - returns a new `Array` object containing all of the `key`'s within the calling `Hash`.
  -  `Enumberable#map` - returns a new `Array` object containing elements that have been transformed from within the block, based on the block's return value. (An alias for `Enumerable#collect`)
  - `Hash#select` - an iterative method that passes each `key` `value` pair within the calling `Hash` into the block, which then returns a new `Hash` object that contains *only* the `key` `value` pair(s) that have returned a truthy value from within the block. (An alias for `Hash#filter`)
  -  `Hash#select!` - an iterative method that passes each `key` `value` pair within the calling `Hash` into the block, which then returns the same *mutated* `Hash` object containing only the `key` `value` pair(s) that have returned a truthy value from within the block. (An alias for `Hash#filter!`)
  - `Hash#value?` - returns a `Boolean`. Accepts one single argument that represents a `value`, returns `true` if `value` exists within the calling `Hash`; otherwise `false`. (An alias for `Hash#has_value?`)
  - `Hash#values` - returns a new `Array` object containing all of the `value`'s within the calling `Hash`.

- `Integer` methods: `times`

  - `Integer#times` - an iterative method that calls the given block `self` times with each `Integer` in `(0..self-1)`. EX: `5.times { |n| p n } # will output => 0 1 2 3 4`. Returns `self` (calling `Integer`).

- iteration, `break` and `next`

  - Iteration - one of the most common actions to perform on a collection is iteration. Ruby gives us many iterative methods, but we can also manually perform iterations with looping. Because a `loop` executes until it meets a certain criteria, `break` and `next` are very useful keywords that help us control execution of expressions.

  - `break` - is used to leave a block early, or to terminate from a `loop`. `break` accepts an argument, for instance if we wanted to terminate from a `loop` when a variable reaches a certain value, we can write: `break if a > 5` . If we use `break` within an iterative method, it causes the entire method to stop execution and there will be no more iterations, then `nil` will be the return value for that method call.

  - `next` - is used to skip the rest of the current iteration. `next` accepts an argument, for instance if we wanted to skip the rest of a current iteration if a variable is odd, we can write: `next if num.odd?` or `next num if num.odd?` . It is important to note that these two expression have different return values:

    - `next if num.odd?` - returns `nil`
    - `next num if num.odd?` - returns `num`

    Also, using `next` within the block in an `#each` method call does not affect the return value of that method call. 

    *When `next` is used in a `loop`, any values following `next` are ignored. In a block however, the expression or expressions become the return value.* 

    ​	- "The Ruby Programming Language" - David Flanagan & Yukihiro Matsumoto (pg. 150)

- selection and transformation

  - Besides iteration, the two most common actions to perform on a collection are *selection* and *transformation*. Similarly to iteration, Ruby has methods to perform these actions but we can also perform these actions manually with a `loop` structure as well. When manually performing these actions, we must have the basic elements of a `loop`: 

    - A `loop`
    - A counter
    - A way to retrieve the current value
    - A way to exit the loop

    When performing selection within a loop, we must also have some sort of conditional statement; which is what performs the selection. (EX: `result << num if num.even?`)

    When performing transformation within a loop, it is important to consider if that transformation we are performing is mutating the original collection or if a new collection is being returned.

    With Ruby, we have some built-in methods that help us achieve this same actions in a more streamlined and cleaner manner:

    * Transformation:
      * `Array#map`
      * `Enumberable#map`
      * `Array#map!`

    * Selection: 
      * `Array#select`
      * `Hash#select`
      * `Kernel#select`
      * `Enumerable#select`
      * `Array#select!`
      * `Hash#select!`
      * `Array#reject`
      * `Hash#reject`
      * `Enumerable#reject`
      * `Array#reject!`
      * `Hash#reject!`

- nested data structures and nested iteration

  - When working with nested data structures, accessing certain elements can get a little tricky. It is important to keep in mind the return value of each individual expression you are performing, because you will likely have to chain methods in order to access individual elements. For instance if you have an `Array` like this: `arr = [[1, 2], [3, 4], {a: 1, b: 2}]`, and wanted to access the `Integer` `3`, you would have to chain methods like so: `arr[1][0]`. In this case `arr[1]` will return `[3, 4]`; which equates to `[3, 4][0]` or `[3, 4].fetch(0)` which then returns `3`. We must be mindful of what each method call, conditional, block, etc. is being performed and the return value for each of those expressions. It is also important to think about what object you are performing actions on, and if there are any side-effects because of those actions. When performing nested iterations it's especially important to be mindful of what the return value for each action you are performing is and if that return value is being used to perform another action.

- shallow copy and deep copy

  - There come times when we want to work with a collection, but do not want to mutate the original collection so you will need to make a copy. Ruby has two methods that let us copy an object, including collections; `#dup` and `#clone`. Both of these methods create a *shallow copy* of an object, which means that only the object that the method was called on is copied. If the object contains other objects, like a nested `Array`, then those objects will be *shared*, not copied. Both of these methods allows objects within the copied object to be modified. When working with copied collections it's important to be aware of what level you're working at. 

  - Shallow copy - stores the references of objects to the original memory address.

  - Deep copy - stores copes of the object's value.

    ```ruby
    # example 1
    arr1 = ['a', 'b', 'c']
    arr2 = arr1.dup
    arr2.map! { |char| char.upcase }
    arr1 # => ['a', 'b', 'c']
    arr2 # => ['A', 'B', 'C']
    ```

    ```ruby
    # example 2
    arr1 = ['a', 'b', 'c']
    arr2 = arr1.dup
    arr2.map { |char| char.upcase! }
    arr1 # => ['A', 'B', 'C']
    arr2 # => ['A', 'B', 'C']
    ```

    In example 1, only `arr2` has changed because we called a destructive method (`map!`) on `arr2` which modified the `Array`, and since we are modifying the `Array` and not the elements within it, `arr1` is left unchanged. In example 2 both `Array`'s are changed because `upcase!` is called on each element within the `Array`.

  - Freezing objects - The main difference between `#dup` and `#clone` is the `#clone` preserves the frozen state of the object. 

    ```ruby
    # example 1
    arr1 = ['a', 'b', 'c'].freeze
    arr2 = arr1.clone
    arr2 << 'd'
    # => FrozenError: can't modify frozen Array
    ```

    ```ruby
    # example 2
    arr1 = ['a', 'b', 'c'].freeze
    arr2 = arr1.dup
    arr2 << 'd'
    arr2 # => ['a', 'b', 'c', 'd']
    arr1 # => ['a', 'b', 'c']
    ```

  - In Ruby, objects can be frozen in order to prevent them from being modified. Only mutable objects can be frozen because immutable objects, like `Integers` are already frozen. To check if an object is frozen we can call `#frozen?` on it. `#freeze` only freezes the object it's called on. If the object it's called on contains other objects, those objects won't be frozen:

    ```ruby
    arr = [[1], [2], [3]].freeze
    arr[2] << 4
    arr # => [[1], [2], [3, 4]]
    ```

- method chaining 

  - In Ruby, method chaining allows you to call multiple methods on an object in a single line of code. It makes for more concise and readable code. However, when performing method chaining, it is important to remember what each method call's return value is so that you do not run into any unexpected errors. For example, lets say we have an `Array` of unsorted `Integers` and we want to return only the even `Integer`'s, but we would like them to be sorted and returned as a `String` object with a space between each number. If we do *not* chain our methods the code would look like this:

    ```ruby
    arr = [2, 54, 12, 35, 89, 198, 3, 5, 14, 98]
    sorted_arr = arr.sort 
    # => [2, 3, 5, 12, 14, 35, 54, 89, 98, 198]
    even_sorted_arr = sorted_arr.select { |num| num.even? }
    # => [2, 12, 14, 54, 98, 198]
    even_sorted_arr.join(' ') 
    # => "2 12 14 54 98 198"
    ```

    However, if we chained our methods, it would look like this:

    ```ruby
    arr = [2, 54, 12, 35, 89, 198, 3, 5, 14, 98]
    arr.sort.select { |num| num.even? }.join(' ')
    # => "2 12 14 54 98 198"
    ```

    