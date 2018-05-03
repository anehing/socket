require 'socket'

# 设置参数

PORT_RANGE = 1..128
HOST = 'archive.org'
TIME_TO_WAIR = 5

# 为每一个端口创建一个套接字,并且发起非阻塞连接

sockets = PORT_RANGE.map do |port|
  socket = Socket.new(:INET,:STREAM)
  remote_addr = Socket.sockaddr_in port, HOST
  begin
    socket.connect_nonblock remote_addr
  rescue Errno::EINPROGRESS
  end
  socket
end

#设置期限

expiration = Time.now + TIME_TO_WAIR

loop do
  rs, ws = IO.select nil, sockets,nil, expiration-Time.now
  unless ws
    break
  end

  ws.each do |w|
    begin
      w.connect_nonblock w.remote_address
    rescue Errno::EISCONN
      # 成功
      puts "#{HOST}: #{w.remote_address.ip_port} accepts connections ..."
      sockets.delete w
    rescue Errno::EINVAL
      sockets.delete w
    end

  end
end