#! usr/bin/ruby -i

    class MarkovDictionary

        def initialize
            @dictionary = {}
        end

        def dictionary
            @dictionary
        end

        def add_word(first, second)
            @dictionary[first] ||= Hash.new(0)
            @dictionary[first][second] += 1
        end

        def read_file(path)
            File.open(path).read.split
        end

        def parse(text_file)
            @contents = read_file(text_file)

            (@contents.length-1).times do |i|
                self.add_word(@contents[i], @contents[i+1])
            end
        end
   end

   class MarkovText

        def initialize(dictionary)
            @dictionary = dictionary
            @sentence = []
        end

        def seed()
            keys = @dictionary.keys
            keys[rand(keys.length)]
        end

        def generate(word_count)
            @sentence << seed
            word_count.times do |_|
                @sentence << next_word(@sentence.last)
            end
            @sentence.join(' ')
        end

        def next_word(word)
            total = @dictionary[word].values.inject(0) { |sum, value| sum + value }
            random = rand(total)+1

            @dictionary[word].each do |key, occurs|
                random -= occurs
                if random < 1
                    return word
                end
            end
        end

    end

    if __FILE__ == $0

        file = ARGV[0] || "Frankentext.txt"
        wordcount = ARGV[1] || 200

        data = MarkovDictionary.new()
        result = MarkovText.new(data.dictionary)
        puts result.generate(wordcount.to_i)
   end
