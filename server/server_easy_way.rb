require 'socket'

server = TCPServer.new('localhost',4481)

servers = Socket.tcp_server_sockets(4481)
servers.each {|s| p s.local_address }