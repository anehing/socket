require 'socket'

socket = Socket.new(:INET,:STREAM)

addr = Socket.pack_sockaddr_in(4481,'0.0.0.0')

socket.bind(addr)

socket.listen(Socket::SOMAXCONN)

#接受连接
connection, addr_info = socket.accept
