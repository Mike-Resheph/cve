#!/usr/bin/env ruby
# By Resheph

require 'open-uri'
require 'nokogiri'

def usage()
    puts "CVE lookup tool v0.1"
    puts "USAGE: ./cve.rb <cve number>"
    puts "ie ./cve.rb CVE-2016-1000216"
end

if ARGV.size != 1 then
    usage()
else
  begin
    page = Nokogiri::HTML(open("https://www.cvedetails.com/cve/#{ARGV[0]}/"))
    puts page.css("title")[0].text
    puts "CVSS Score: #{page.css("table\#cvssscorestable[class='details'] div").text}"
    puts "Confidentiality Impact: #{page.css("table\#cvssscorestable[class='details'] span")[0].text} #{page.css("table\#cvssscorestable[class='detai$
    puts "Integrity Impact: #{page.css("table\#cvssscorestable[class='details'] span")[2].text} #{page.css("table\#cvssscorestable[class='details'] s$
    puts "Availability Impact: #{page.css("table\#cvssscorestable[class='details'] span")[4].text} #{page.css("table\#cvssscorestable[class='details'$
    puts "Access Complexity: #{page.css("table\#cvssscorestable[class='details'] span")[6].text} #{page.css("table\#cvssscorestable[class='details'] $
    puts "Authentication: #{page.css("table\#cvssscorestable[class='details'] span")[8].text} #{page.css("table\#cvssscorestable[class='details'] spa$
    puts "Gained Access: #{page.css("table\#cvssscorestable[class='details'] span")[10].text}"
    puts "Vulnerability Type(s): #{page.css("table\#cvssscorestable[class='details'] span")[11].text}"
  rescue
    puts "Something went wrong!"
  end
end
