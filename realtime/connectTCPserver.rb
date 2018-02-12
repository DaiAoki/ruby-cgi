#!/usr/bin/ruby
require "socket"

s = TCPServer.open(20000)

loop do
  socket = s.accept
  Thread.start(s.accept) do |client|
    print client.gets
    p socket.peeraddr

    while buf = socket.gets
      p buf
    end

    sleep(5)

    client.puts "OK"

    client.close
  end
end
