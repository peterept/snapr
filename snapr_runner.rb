require 'lolcommits'
require 'catpix'
require 'io/console'
require_relative 'snapr_receiver'
require_relative 'snapr_sender'

# HACK LOLCOMMITS: We have to provide lolcommits with a debug method
def debug(s)
end

# HACK CATPIX inject a way into catpix to get the image
module Catpix
  @@raw_img = ""
  def self.raw_img
    @@raw_img
  end
  # HACK: override the puts method that is used to output the image row by row
  #       and keep the ressult in @@raw_image
  def self.puts(s)
    @@raw_img += s + "\n"
    $stdout.puts s
  end
end


class SnaprRunner

  def self.capture_image

  end

  def self.watch 
    SnaprReceiver.run
  end

  def self.send(msg, user = "")

    #
    # use LOLCommits to take a webcam photo and generate an image
    #

    # save images to current folder
    lolcommits_configuration = Lolcommits::Configuration.new(loldir: "./")
    lolcommits_options = {
      capture_delay: 0,
      capture_stealth: false,
      capture_animate: 0,
      config: lolcommits_configuration,
      message: msg,
      sha: user
    }

    # run lolcommits
    runner = Lolcommits::Runner.new(lolcommits_options)
    runner.run
    filename = runner.main_image

    #
    # use catpix to load the image as ASCII
    #

    # load the image with CatPix
    Catpix::print_image filename,
      :limit_x => 0,
      :limit_y => 0.8,
      :center_x => true,
      :center_y => true,
      :bg => "black",
      :bg_fill => true

    # Broadcast the image on the network
    puts "Sending Image '#{filename}'..."
    SnaprSender.send(Catpix.raw_img)
    puts "Done"
  end
end

