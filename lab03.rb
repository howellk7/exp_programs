#!/usr/bin/ruby

# File: Lab03
# User: Kevin Howell
# Course: CIT 380-003
# Date: 20170908

# initialize required variables
numbers = []		# or numbers = Array.new
sum = 99999
resp = ' '

#debugging
#p "numbers is currently #{numbers}"
#p "sum is currently #{sum}"
#p "resp is currently #{resp}"

# user instruction
puts "Enter a series of intergers seperated by carriage returns. Enter -99999 to quit."

# get the initial response to seed the loop control variable
resp = gets.to_i

### number 9 and 10 of lab = next 3 lines deleted
### get the initial user response
###resp = gets
###resp = gets.chomp

#  p "resp is initially set to #{resp}"

# loop unitl resp = -99999
while resp != -99999
  resp = gets.chomp.to_i
  numbers << resp
  resp = numbers.last
end

p numbers

# beginning of sum calculator and display
puts "Numbers entered: "
puts "======================="
numbers.each do |n| 
  puts n 
  sum += n
end

puts "Sum:  #{sum}"

