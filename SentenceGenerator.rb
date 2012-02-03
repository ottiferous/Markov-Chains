   class SentenceGenerator

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
                @sentence << weighted_random(@sentence.last)
            end
            @sentence.join(' ')
        end

        def weighted_random(word)
            total = @dictionary[word].values.inject(0) { |sum, value| sum + value }
            random = rand(total)+1

            @dictionary[word].each do |key, occurs|
                random -= occurs
                if random < 1
                    return key
                end
            end
        end

    end
