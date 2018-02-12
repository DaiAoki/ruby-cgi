#!/usr/bin/ruby
require 'socket'

# localhostのポート20000番のソケットを開ける
socket = TCPSocket.open("localhost", 20000)

# 文字列入力を受け付ける
while line = $stdin.gets
  socket.puts line
  socket.flush

  puts socket.gets
end

socket.close
