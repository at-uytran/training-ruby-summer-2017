
# Day 23-06-2017

----------

[TOC]

## CLASS
>In our real life, every thing are objects with their actions and their properties
>class is aggregate of many object that have same properties and actions
```ruby
class ClassName
	#declare this class here
end 
```
### METHOD
>Class contain methods and attributes, this can make class communicate with other class
```ruby
class ClassName
	public 
	def methodname
			define this method
	end
end
```
#### CLASS METHOD
>We can call class method but not create a object of  this class.
Out of this class, we can singly call this method
```ruby
class ClassName
public 
def ClassName.methodname(attr)
#	define of this method
end

```
### INITIALIZE ATTRIBUTE 
>When we create a class, if we want to initialize some attributes, use initialize method to insert attributes.
```ruby
class ClassName
	@name
	def initialize(name)
		@name = name
	end
end
```
### SET ATTRIBUTE FOR CLASS
>Another way of initialize, we can use some way to set attributes to class
```ruby
class A
	attr_reader	:name
	attr_writer	:name
end
```
### GET ATTRIBUTE OF CLASS
>As set attribute, we can get attributes to a class by define a method to get it.
But by a easy way, we can use the code below:
```ruby
 attr_accessor :name

```

## OBJECT
>Object is  instance of a real life in developing. 
Use attribute and , method to describe a real life animal, tree, people or car...
if in real life, Car have some properties like color, speed, weight... and car can run, turn, stop or break, in object of a class, we can describe this information and actions

```ruby
class ClassName
public 
def methodname(attr)
#	define of this method
end
a = ClassName.new
a.method(4)
```

### MODULE
>Module is a component that we want to use in a class.
If a class have not some function, we can define a module and add it to this class by using include or extend

Describe amodule:
```ruby
module	Action
 	def	jump
 		@distance	=	rand(4)	+	2
 		puts	"I	jumped	forward	#{@distance}	feet!"
 	end
 end
```
And we call it in another class:

```ruby
class	Rabbit
	include	Action
	attr_reader	:name
	def	initialize(name)
		@name	=	name
	end
end
```
Now "Rabbit can jump" -  Class Rabbit now have method jump
### INCLUDE
>A class if extend another class, we can use method of this class by using .new.
That mean if you use include B inside class A, method of B are not Class method of Class A
### EXTEND
>It's opposite of Extend mean method of class B is method of class A




