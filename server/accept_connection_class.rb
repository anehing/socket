require 'socket'


server = Socket.new(:INET,:STREAM)

addr = Socket.pack_sockaddr_in(4481,'0.0.0.0')

server.bind(addr)

server.listen(Socket::SOMAXCONN)

#接受连接
connection, addr_info = server.accept

print 'connection class: '
p connection.class

print 'Server fileno: '
p server.fileno

print 'Connection fileno: '
p connection.fileno

print 'local address: '
p connection.local_address

print 'remote address: '
p connection.remote_address

print 'addr_info : '
p addr_info

#  addr_info == connection.remote_address. 一个connection 包含了两个端点的地址