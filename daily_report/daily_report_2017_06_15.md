
# Data structured



[TOC]
## Array
### Array
array is a data structured of values or variables, objects...
it contain many members or no member.
```ruby
arr =	["Andes", 2, "Everest",	42, "gamer"]
arr1 = Array.new(19)
arr = Array.new    #=> []
arr.new(3)       #=> [nil, nil, nil]
Array.new(3, 2) #=> [2, 2, 2]

```
### Array.collect

collect is a method that change all member in array with a new value, it can be increase, subtract, div or multiplication
```ruby
arr = [2,3,4,5]
arr.collect{|i| i*2}
#=> [4,6,8,10]
#arr = [2,3,4,5]
```
### Bang method
when you use bang method by add at end  of method by '!'
the values of this array were change
``` ruby
arr = [2,3,4,5]
arr.collect!{|i| i*2}
# arr = [4,6,8,10]
```

### Each_index
It like for loop, by browse all members of array
```ruby
arr = [2,3,4,5]
arr.each_index{|i| puts i}
```
### Increase instead values 
with an array declared, you can add values to this array by using assign
```ruby
#arr[index,length] = object
arr = [1,3,4,2,1]
arr[1,3]= [9,5]
#arr = [1,[9,5],1]
```


### array push 
given object(s) to the end of arrays
```ruby
arr = [1,3,4,2,1]
arr.push(9).push(10)
#arr = [1,3,4,2,1,9,10]
```
### array pop
```ruby
arr = [1,3,4,2,1]
arr.pop #=> [1,3,4,2]
arr.pop(3) #=>[1,3]
```
### push  object on to the end of array  
<< operation can push object(s) on to the end of array
```ruby
[1,2]<<3<<4
#[1,2,3,4]
```

## Hash
hash is same array by many ways 
Different between hash and array:
 in array you could index members by integer but in hash, you can index members by key
 
 

