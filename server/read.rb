require 'socket'

Socket.tcp_server_loop(4481) do |connection |
  connection.read
  connection.close

end