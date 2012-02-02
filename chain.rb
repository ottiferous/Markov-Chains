#! usr/bin/ruby

    class MarkovDictionary

        def initialize
            @dictionary = {}
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

        def put()
            for element in @dictionary do
                puts element
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

        def select_word(dictionary)
            

        def construct(length)
            
            length.times do
                total = @dictionary[@sentence.last].values.inject(0) { |sum, value| sum + value }

                until total < 1
                    total -= @dictionary[@sentence.last].value


            end
        end
    end

   if __FILE__ == $0
        data = MarkovDictionary.new()
        data.parse("rubytest")
        data.put()
   end
