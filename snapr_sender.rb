require "socket"
require "zlib"

class SnaprSender

	MULTICAST_ADDR = "224.0.0.1"
	PORT = 3000

	def self.send img
		compressed = Zlib::Deflate.deflate(img)
		socket = UDPSocket.open
		socket.setsockopt(:IPPROTO_IP, :IP_MULTICAST_TTL, 1)
		socket.send(compressed, 0, MULTICAST_ADDR, PORT)
		socket.close
	end

end