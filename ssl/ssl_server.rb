require 'socket'
require 'openssl'

def main
  # 建立TCP服务器
  server = TCPServer.new('0.0.0.0',4481)

  # 建立SSL环境
  ctx = OpenSSL::SSL::SSLContext.new

  ctx.cert, ctx.key = create_self_signed_cert(1024,[['CN','0.0.0.0']], "Generated by Ruby/OpenSSL")

  ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # 建立TCP服务的SSL包装器

  ssl_server = OpenSSL::SSL::SSLServer.new server, ctx

  #在ssl套接字上接受连接
  connection = ssl_server.accept
  #处理连接
  connection.write("Bah now")
  connection.close
end

