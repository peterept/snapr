require "zlib"

class SnaprMessage

	attr_accessor :message

	def initialize(message)
		@message = message
	end

	def encode_to_ascii
		Zlib::Deflate.deflate(@message)
	end

	def self.decode_from_ascii(encoded_string)
		SnaprMessage.new Zlib::Inflate.inflate(encoded_string)
	end

end