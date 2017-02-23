require 'test/unit'
require_relative 'snapr_message'

class SnaprMessageTest < Test::Unit::TestCase

  def test_message
    msg = SnaprMessage.new("Hello")
  	assert_equal("Hello", msg.message)
  end

  def test_encoding
    msg = SnaprMessage.new("Hello")
    expected = "x\x9C\xF3H\xCD\xC9\xC9\a\x00\x05\x8C\x01\xF5".force_encoding('ASCII-8BIT') 
    assert_equal(expected, msg.encode_to_ascii)
  end

  def test_decoding
    data = "x\x9C\xF3H\xCD\xC9\xC9\a\x00\x05\x8C\x01\xF5".force_encoding('ASCII-8BIT')
    msg = SnaprMessage.decode_from_ascii(data)
    assert_equal("Hello", msg.message)
  end
end
