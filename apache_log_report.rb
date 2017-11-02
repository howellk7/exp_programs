#!/usr/bin/ruby

# Filename: apache_log_report.rb
# Usr: Kevin Howell
# course: CIT383
# Instructor: McCord


###
###  hashes wouldn't pick up new values during array iteration
###  to get everything to work correctly
###
a1 = Array.new       # Apache log file lines
h1 = Hash.new  	     # Hash for IP addresses from Array
h2 = Hash.new        # Hash for URLs from Array
h3 = Hash.new        # Hash for HTTP status codes

# proccess text file into array
a1 = [ ]
a1 = File.readlines("access_log")
#p a1.size
###a1.each { |line|  p "Line: #{line}" } # ; p

# parse array line into 3 parts (ip, url, code)
a1.each do |line| 

  if match = line.match(/^([:\d\.]+) .*\[.*\].*\"[A-Z]+ *(.+) HTTP/)
  ip, url  = match.captures
  h1[:ip_key] = ip.to_s
  h2[:url_key] = url.to_s
  end
  if match = line.match(/\s(\d{3})\s/)
  status = match.captures
  h3[:status_key] = status.to_s
  end
# debuging print statements
#  p ip
#  p url
#  p status
end
# debugging hashes
#p h1.size
#p h2.size
#p h3.size
#p h1[:ip_key]
#p h2[:url_key]
#p h3[:status_key]
 
# descriptive header
puts "---------------------------------------------------------"
puts "Statistics for the Apache log file access_log            "
puts "---------------------------------------------------------"
puts  

# freq of ip
puts "Frequency of Client IP Addresses:         "
h1.each do |k,v| 
##  p "#{k} \t"
##  v.times { print "*" }
  printf("%-20s", v); print "*" * v.to_i
  puts
end  
puts
puts
# freq of urls
puts "Frequency of URLs Accessed: "
#h2.each do |k,v|
printf("%-45s", "#{h2[:url_key]}"); p h2.count
#  puts
#end 
# 
puts
puts
# status summary
puts "HTTP Status Codes Summary: "
printf("%-10s", "#{h3[:status_key]}"); # percentag code freq
#
#

#p "eof"
