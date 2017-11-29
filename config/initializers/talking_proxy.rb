class TalkingProxy
	include Singleton

	def get_response query 
		@nn_instance.get_reply(query)
	end

	private

  def initialize
    puts 'heavy work loading..'
    # Load the JVM specifying the jar files to include and any other optional JVM arguments
		 
		Rjb::load(classpath = ".:#{Rails.root}/vendor/lambda-java-example-0.0.1-SNAPSHOT.jar", jvmargs=[])
		# Import the classes you want to use into a Ruby variable
		# specify the full package path to the classes.
		nn = Rjb::import('jar.NN')
		@nn_instance = nn.new("#{Rails.root}/tmp/")
  end
end

$talking_proxy = TalkingProxy.instance