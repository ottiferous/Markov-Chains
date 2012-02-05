require_relative 'MarkovDictionary.rb'
require_relative 'SentenceGenerator.rb'

if __FILE__ == $0

		filename = ARGV[0] || 'dict/dict.json'
    wordcount = ARGV[1] || 20

    data = PersistentDictionary.new
    data.load(filename)
    result = TwoSentenceGen.new(data.dictionary)
    (1..10).each { puts result.generate(wordcount.to_i-1) }

end
