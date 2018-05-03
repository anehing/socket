require 'socket'

client = TCPSocket.new('localhost',4481)

payload = 'hihihihi' * 10_00

begin
  loop do
    bytes = client.wirte_nonblock(payload)
    break if bytes >= payload.size

    payload.slice!(0,bytes)
    IO.select(nil,[client])
  end
rescue Errno::EAGAIN
  IO.select(nil,[client])
  retry
end
