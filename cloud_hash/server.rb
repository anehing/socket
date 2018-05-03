#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'socket'
module CloudHash
  class Server

    def initialize(port)
      @server = TCPServer.new('0.0.0.0',port)
      puts "listening on port #{ @server.local_address.ip_port}"
      @storage = {}
    end

    def start
      #accept 循环
      Socket.accept_loop(@server) do |connection|
        handle(connection)
        connection.close
      end
    end

    def handle(connection)
      #从连接中读取,直到出现EOF

      request = connection.read

      #将hash操作的结果写回
      connection.write process(request)

    end

    #所支持的命令
    # set key value
    # get key
    def process(request)
      command , key ,value = request.split
      case command.upcase
      when 'GET'
        "GET: #{@storage[key]}"
      when 'SET'
        "SET: #{@storage[key] = value}"
      end
    end
  end
end

server = CloudHash::Server.new(4481)

server.start