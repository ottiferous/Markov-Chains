require 'watir-webdriver'
require 'headless'

login = ""
password = ""

message = "I'm not supposed to be here, @Matthew Furden"

headless = Headless.new
headless.start

b = Watir::Browser.new :chrome
b.goto 'facebook.com'
b.text_field(:id => 'email').set login
b.text_field(:id => 'pass').set password
b.input(:value => "Log In").click

b.text_field(:class => 'uiTextareaAutogrow input mentionsTextarea textInput').set message
b.send_keys :enter
b.input(:value => 'Post').click
b.div(:class => 'menuPulldown').click
b.input(:value => 'Log Out').click
b.send_keys :enter
b.close

Headless.destroy

