require 'socket'

server = TCPServer.new('0.0.0.0',4481)

#进入无限循环.接受并处理连接

Socket.accept_loop(server) do |connection|
  # 处理连接
  connection.close
end