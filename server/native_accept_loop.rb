require 'socket'


server = Socket.new(:INET,:STREAM)

addr = Socket.pack_sockaddr_in(4481,'0.0.0.0')

server.bind(addr)

server.listen(Socket::SOMAXCONN)

#进入无线循环,接受处理连接
loop do
  connection, addr_info = server.accept
  # 处理连接
  connection.close
end