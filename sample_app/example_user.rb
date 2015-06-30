class User
	attr_accessor :name, :email

	# gets called when new is called
	def initialize(attributes = {})
		@name = attributes[:name]
		@email = attributes[:email]
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end
end