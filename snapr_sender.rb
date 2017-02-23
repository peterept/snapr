require "socket"
require "zlib"
require_relative "snapr_message"

class SnaprSender

	MULTICAST_ADDR = "224.0.0.1"
	PORT = 3000

	def self.send msg
		socket = UDPSocket.open
		socket.setsockopt(:IPPROTO_IP, :IP_MULTICAST_TTL, 1)
		socket.send(msg.encode_to_ascii, 0, MULTICAST_ADDR, PORT)
		socket.close
	end

end