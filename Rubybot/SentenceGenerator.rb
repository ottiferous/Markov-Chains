class SentenceGenerator

    def initialize(dictionary)
        @dictionary = dictionary
    end

    def random_word()
        keys = @dictionary.keys
        keys[rand(keys.length)]
    end

    def generate(word_count)
        sentence = []
        sentence << random_word
        (word_count-1).times do |_|
            sentence << weighted_random(sentence.last)
        end
        sentence.join(' ')
    end

    def weighted_random(word)
        total = @dictionary[word].values.reduce(:+)
        random = rand(total)+1

        @dictionary[word].each do |key, occurs|
            random -= occurs
            return key if random < 1
            return random_word() if key.nil?
        end
    end

end
