#homework 15-06-2017

# fibonacci
def fibonacci(n)
	if n==0 
		return 0
	elsif n==1
		return 1
	else
		return (fibonacci(n-1)+fibonacci(n-2))
	end	
end
puts(fibonacci(9))

# prime number
def primenumb(n)
	mid = n/2
	for i in 2..mid
		if(n%i==0) then return false
		end
	end
	return true
end
puts(primenumb(8))

# perfect number

def perfectnumb(n)
	mid = n/2
	sum = 0
	for i in 1..mid
		a = n%i 
		if (a==0) then sum +=i
		end
	end
	if sum==n then return true
	else
		return false
	end
end
puts(perfectnumb(6))


# century of a year
def century(n)
	return n/100+1
end
puts(century(1905))


# print sum members
def print_sum_members
	sum =0
	n=0
	puts "input "
	n = gets.chomp.to_i
	if n<0
		puts "#{n} <0"
	else 
		puts "output "
		for i in 0..n-1
			print "#{i} +"
			sum+=i
		end
		print "#{n} = #{sum+n}"
	end
end
print_sum_members

#get_square
def get_square(x,y)
	puts x
	arr = Array.new
	for i in 1..y
		square = i*i
		if square<=y && square >=x
			arr.push(square)
		end
	end
	puts arr
end
get_square(1,100)