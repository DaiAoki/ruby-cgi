#!/usr/bin/ruby
require 'socket'

server = TCPServer.new(20000)

loop do
  # port 20000番でソケットを作成する
  socket = server.accept

  # socket接続口から文字列を受け取る
  while str = socket.gets.chomp
    puts "Receive: #{str}"

    # socket_serverを起動しているターミナル上に表示する
    socket.puts "SERVER received '#{str}' from Client."
  end

  socket.close
end
