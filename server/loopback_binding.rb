require 'socket'

#127.0.0.1是环回接口,只监听本地的客户端

local_socket = Socket.new(:INET,:STREAM)

local_addr = Socket.pack_sockaddr_in(4481,'127.0.0.1')

local_socket.bind(local_addr)

#0.0.0.0绑定 所有已知的接口
any_socket = Socket.new(:INET,:STREAM)

any_addr = Socket.pack_sockaddr_in(4481,'127.0.0.1')

any_socket.bind(any_addr)