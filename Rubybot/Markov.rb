require_relative 'MarkovDictionary.rb'
require_relative 'SentenceGenerator.rb'

if __FILE__ == $0

    wordcount = ARGV[0] || 20

    data = PersistentDictionary.new
    result = TwoSentenceGen.new(data.dictionary)
    (1..10).each { puts result.generate(wordcount.to_i-1) }

end
