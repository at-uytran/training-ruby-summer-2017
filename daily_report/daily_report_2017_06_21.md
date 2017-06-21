
# Day 21-06-2017

----------

[TOC]

## CLOSURE

> closure as same as a function
> when we need a environment to run with instance variables, local variables, self... with bound of it


### block
Block is not a instance

```ruby
block { }
do ... 
end
```

### proc
Proc  is a instance
When proc have a return, this return is not break from this method
Proc is not check for input argument s that mean when you put more than or less than default input, proc is not check for it, if you put less input arguments, the default is nil
```ruby
def proc_test
	proc = Proc.new{return}
	proc.call
	p "hello"
	p "return for this proc_test"
end
# OR

mul_of_3 = Proc.new do |n|
	n.to_i%3 ==0
end
```
### lambda
Lambda is an instance of a proc
Lambda is check number of arguments when you input to it.
If input is not match, program is cannot run and return error.
When lambda have a return, this return make a break from this method
```ruby
def lambda_test
	lam = lambda{return}
	lam.call
	p "lambda hello"
	p "just return of lambda "
end
```
## GEM
gem is same as package in another language like java,c#...
it is library for developer to use 
Gem help us easier  to develop with Ruby language



### install gem

```ruby
gem install [gem_name]

```
###  gem search
```
gem search -r
```
### gem list


```
gem list
```
### insert content to a box
when we want to insert content to a box 
```css
box ::after{
	display content
}
```

