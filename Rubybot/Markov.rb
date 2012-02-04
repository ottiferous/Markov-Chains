require_relative 'MarkovDictionary.rb'
require_relative 'SentenceGenerator.rb'

if __FILE__ == $0

    file = ARGV[0] || "Frankentext.txt"
    wordcount = ARGV[1] || 200

    data = TwoWordDictionary.new(file)
    result = TwoSentenceGen.new(data.dictionary)
    puts result.generate(wordcount.to_i-1)

end
