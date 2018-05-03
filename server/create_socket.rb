require 'socket'

# Socket::AF_INET 指代IPv4; SOCK_STREAM表示使用数据流通信.还有DGRAM数据报UDP

socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)
