#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'socket'
require 'thread'
require_relative './command_handler'


module FTP
  Connection = Struct.new(:client) do

    CRLF = "\r\n"

    def gets
      @client.gets(CRLF)
    end

    def respond(message)
      @client.write(message)
      @client.write(CRLF)
    end

    def close
      @client.close
    end
  end

  class ThreadPerConnection
    def initialize(port = 21)
      @control_socket = ::TCPServer.new('0.0.0.0',port)
      trap(:INT){exit}
    end


    def run
      Thread.abort_on_exception = true

      loop do
        conn = Connection.new @control_socket.accept


        Thread.fork do
          conn.respond "220 OHAI"
          handler = CommandHandler.new(conn)
          loop do
            request = conn.gets
            if request
              conn.respond handler.handle(request)
            else
              conn.close
              break
            end
          end
        end
        Process.detach(pid)
      end
    end
  end
end

server = FTP::ThreadPerConnection.new(4481)

server.run