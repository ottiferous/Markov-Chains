require 'watir-webdriver'

class Facebook

	def initialize
		@b = Watir::Browser.new :chrome
	end
	
	def login(name, pass)
		@b.goto 'https://www.facebook.com'
		@b.text_field(:id => 'email').set name
		@b.text_field(:id => 'pass').set pass
		@b.input(:value => 'Log In').click
	end

	def post(message)
		@b.text_field(:class => 'uiTextareaAutogrow input mentionsTextarea textInput').set message
		@b.send_keys :enter
		@b.input(:value => 'Post').click
	end

	def logout
		@b.div(:class => 'menuPulldown').click
		@b.input(:value => 'Log Out').click
		@b.send_keys :enter										#in case a dialouge box pops up
	end

	def close
		@b.close
	end

end
