require 'socket'

socket = Socket.new(:INET,:STREAM)

addr = Socket.pack_sockaddr_in(4481,'0.0.0.0')

socket.bind(addr)

#告知套接字侦听接入的连接
#套接字能容纳待处理的最大连接数. 侦听队列
socket.listen(Socket::SOMAXCONN)