### Hash compare
```ruby
hash1 ={shoes: "nike","hat" => "adidas", :hoodie => true}
hash2 ={"hat" => "adidas",:shoes => "nike", hoodie: true}
#hash1==hash2 => true
```

### merge hash
add a member to hash
```ruby
hash1.merge({:hoodie => false})

```
or we can add by this way
```ruby
hash1[:f] = 9
```
### hash values
return values of hash members

```ruby
hash1.values

```

### delete_if
delete in hash with condition

```ruby
h.delete_if { |key,values| values < 3.5 }
```

### convert hash to array

```ruby
hash1.to_a

```
## String 
>string is a variable by many characters
### string count
to count a character or a string in a string
```ruby
"abcd".count("a") #=> 1
"abcd".count("ab") #=> 1
```
### position of a character 
to call a character at a position in a string
```ruby
a = "abcdef"
#a[1] => "b"
```
### string split
secede a string to a words array
```ruby
str = "hello ruby world"
str.split #=> ["hello","ruby","world"]
```
###  string downcase
to down-case a string, we use downcase method
```ruby
str = "Hello Ruby World"
str.downcase! #=> "hello ruby world"
```

### to-integer method
to convert a string to integer by another basis system we can use string.to_i(basis) method
```ruby
"0a".to_i(16) #=> 10
```
### delete char
to delete character(s) in a string, we use delete method
```ruby
a= "abcdef"
a.delete!("ab") => a= "cdef"
```
