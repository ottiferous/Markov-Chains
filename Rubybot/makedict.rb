require_relative 'MarkovDictionary.rb'

if __FILE__ == $0
	input = ARGV[0] || "dict.txt"
	output = ARGV[1] || "dict.json"

	data = PersistentDictionary.new
	data.parse_file('text/' + input)
	data.save_dic('dict/' + output)
end
