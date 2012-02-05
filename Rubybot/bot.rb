require_relative 'FaceDriver.rb'
require_relative 'SentenceGenerator.rb'
require_relative 'MarkovDictionary'

if __FILE__ == $0
	connect = FaceDriver.new
	connect.login(ARGV[0], ARGV[1])

	data = PersistentDictionary.new('wall.json')
	result = TwoSentenceGen.new(data.dictionary)
	message = result.generate(8)

	connect.post(message)
	connect.logout
	connect.close
end
