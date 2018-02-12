#!/usr/bin/ruby
require "socket"
puts "plase enter username"
user = gets.to_s

def mainSystem
  puts "please enter message"
  msg = gets.to_s
  exit if msg == "exit"
  port.puts msg
  puts "Send: #{Time.now}"

  print port.gets

  puts "Receive: #{Time.now}"

  port.close
end

begin
  port = TCPSocket.open("localhost", 20000)
rescue
  puts "TCPSocket.open failed :#$!"
else
  loop do
    puts "please enter message"
    msg = gets.to_s
    exit! if msg == "exit"
    port.puts "#{user}:#{msg}"
    puts "Send: #{Time.now}"
    p port.gets
    puts "Receive: #{Time.now}"
  end
  port.close
end
