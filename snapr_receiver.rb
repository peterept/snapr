require "socket"
require "ipaddr"
require "zlib"

class SnaprReceiver

	MULTICAST_ADDR = "224.0.0.1"
	BIND_ADDR = "0.0.0.0"
	PORT = 3000

	def self.run

		socket = UDPSocket.new
		membership = IPAddr.new(MULTICAST_ADDR).hton + IPAddr.new(BIND_ADDR).hton

		socket.setsockopt(:IPPROTO_IP, :IP_ADD_MEMBERSHIP, membership)
		socket.setsockopt(:SOL_SOCKET, :SO_REUSEPORT, 1)

		socket.bind(BIND_ADDR, PORT)

		loop do
		  message, _ = socket.recvfrom(65000)
    	  system('clear')
		  puts Zlib::Inflate.inflate(message)
		  # keep the image up for atleast 5 seconds
		  sleep 5
		end
	end
end

