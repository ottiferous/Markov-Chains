require 'json'

class MarkovDictionary

    def initialize(text_source)
        @dictionary = {}
        self.parse_file(text_source)
    end

    def dictionary
        @dictionary
    end

    def add_word(first, second)
        @dictionary[first] ||= Hash.new(0)
        @dictionary[first][second] += 1
    end

    def parse_file(file)
        contents = open_source(file)
        (contents.length-1).times do |i|
            self.add_word(contents[i], contents[i+1])
        end
    end

    def open_source(file)
				File.open(file, 'r').read.split
		end
end

class TwoWordDictionary < MarkovDictionary

    def add_word(root, suffix)
        @dictionary[root] ||= Hash.new(0)
        @dictionary[root][suffix] ||= 0
        @dictionary[root][suffix] += 1
    end

    def parse_file(file)
    	contents = open_source(file)

    	contents.each_cons(3) do |first, second, third|
				self.add_word("#{first} #{second}", third)
			end
			@dictionary[contents.last(2).join(' ')] ||= Hash.new(0)
    end
    
end

class PersistentDictionary < TwoWordDictionary

	def initialize
		@dictionary = JSON.parse(File.read('dict.json'))
	end

	def save_dic
		File.open('dict.json', 'w') { |f| f.write(JSON.generate(@dictionary)) }
	end

	def merge_with(newdict)
		@dictionary = parse_file(newdict)
	end

end
