require 'socket'


server = Socket.new(:INET,:STREAM)

addr = Socket.pack_sockaddr_in(4481,'0.0.0.0')

server.bind(addr)

server.listen(Socket::SOMAXCONN)


connection, addr_info = server.accept

copy =  connection.dup

#关闭所有的连接通信
connection.shutdown

#关闭原始连接.副本在垃圾回收中处理
connection.close

