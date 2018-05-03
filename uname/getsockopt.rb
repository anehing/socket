require 'socket'

socket = TCPSocket.new('baidu.com',80)

#获取一个描述套接字类型的Socket::Option 实例

opt = socket.getsockopt(Socket::SOL_SOCKET,Socket::SO_TYPE)

#将描述该选项的整数值同存储在Socket::SOCK_STREAM中的整数值进行比较

puts opt.int == Socket::SOCK_STREAM

puts opt.int == Socket::SOCK_DGRAM