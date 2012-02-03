load 'MarkovDictionary.rb'
load 'SentenceGenerator.rb'

if __FILE__ == $0

    file = ARGV[0] || "Frankentext.txt"
    wordcount = ARGV[1] || 200

    data = MarkovDictionary.new(file)
    result = SentenceGenerator.new(data.dictionary)
    puts result.generate(wordcount.to_i)

end
