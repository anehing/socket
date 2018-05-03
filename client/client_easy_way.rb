require 'socket'

socket = TCPSocket.new('baidu.com',80)

rp, wp = IO.pipe
mesg = "ping "
loop do
  rs, ws, = IO.select([rp], [wp])
  if r = rs[0]
    ret = r.read(5)
    print ret
    case ret
      when /ping/
        mesg = "pong\n"
      when /pong/
        mesg = "ping "
    end
  end
  if w = ws[0]
    w.write(mesg)
  end
end