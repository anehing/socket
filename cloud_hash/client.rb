require 'socket'

module CloudHash
  class Client
    class << self
      attr_accessor :host,:port
    end

    def self.get(key)
      request "GET #{key}"
    end

    def self.set(key,value)
      request "SET #{key} #{value}"
    end

    def self.request(string)
      #为每一个请求操作,创建一个新的连接
      @client = TCPSocket.new(host, port)
      @client.write string

      #完成请求之后发送EOF
      @client.close_write

      #一直读取到EOF来获取相应信息
      @client.read
    end
  end
end

CloudHash::Client.host = 'localhost'
CloudHash::Client.port = 4481

puts CloudHash::Client.set('prez','obama')

puts CloudHash::Client.get('prez')

puts CloudHash::Client.get('vp')
