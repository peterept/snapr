require_relative 'snapr_runner'

# process the command line
if ARGV[0] == "-watch"
	puts "Snapr is waiting for images to arrive..."
	SnaprRunner.watch
elsif ARGV[0].nil?
	puts "Snapr - Share a webcam photo and message!\n" \
	     "Usage:\n" \
	     "  Send a message:       $ ruby snapr.rb \"Your Message in Quotes\"\n" \
	     "  Live message display: $ ruby snapr.rb -watch"
else

	SnaprRunner.send ARGV[0], ENV['USER']
end
