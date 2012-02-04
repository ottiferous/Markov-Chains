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
        contents = File.open(file, "r").read.split
        (contents.length-1).times do |i|
            self.add_word(contents[i], contents[i+1])
        end
    end
end

class TwoWordDictionary < MarkovDictionary

    def add_word(root, suffix)
        @dictionary[root] ||= Hash.new(0)
        @dictionary[root][suffix] ||= Hash.new(0)
        @dictionary[root][suffix] += 1
    end

    def parse_file(file)
        contents = File.open(file, "r").read.split
        (contents.length-3).times do |i|
            rootword = "#{contents[i]} #{contents[i+1]}"
            self.add_word(rootword, contents[i+2])
        end
    end
end

class PersistentDictionary < TwoWordDictionary

	def load_dic(filename)
		"This function is not yet implemented"
	end

	def save_dic
		"This function is not yet implemented"
	end

end
