require 'socket'


server = Socket.new(:INET,:STREAM)

addr = Socket.pack_sockaddr_in(4481,'0.0.0.0')

server.bind(addr)

server.listen(Socket::SOMAXCONN)


connection, addr_info = server.accept

#不再写入数据
connection.close_write

#不再进行读操作
connection.close_read

#close_write和close_read,底层调用shut_down.是会关闭所有fork出的socket.close()只对当前有效