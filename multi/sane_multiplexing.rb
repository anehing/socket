# # 创建一个连接数组
#   connections = [<TCPSocket>,<TCPSocket>,<TCPSocket>]
#
#   loop do
#     ready = IO.select connections
#
#     readable_connections = ready[0]
#     readable_connections.each do |conn|
#       begin
#         conn.read_nonblock(4096)
#       rescue Errno::EAGAIN
#       end
#     end
#   end