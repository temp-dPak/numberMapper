class NumberMapper

def validator digits
	#puts "Validator - " + digits
	#### Validates length and nil calss of input digit
	digits.length != 10 ? false : digits.nil? ? false : true
end

def mapper digits
	###### Maps digits to pool of letters
	alphabets = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
	digits.chars.map{|digit| alphabets[digit]}
end

#### Generates the words with the letter pool available and maps with words in dictionary
def wordsmith letter_pool
	### Dictionary Read ###
    dictionary = []
    file_path = "dictionary.txt"
    File.foreach( file_path ) do |word|
      dictionary.push word.chop.to_s.downcase
    end
	#puts "----------------->" + dictionary.size.to_s
	############## EO Dicitonary

	############ Begin generating words ##############
	## Result holder
	results = {}
	total_number = letter_pool.length - 1
	########## Check for words with 3 chars ########
	for i in (2..total_number)
		######## 3 chararcters are held in min_word ; rest of all held in rest ############ 
		min_word = letter_pool[0..i]
		rest = letter_pool[i + 1..total_number]
		next if min_word.length < 3 || rest.length < 3
		######## All permutations of min_word resides in first_set
		first_set = min_word.shift.product(*min_word).map(&:join)
		next if first_set.nil?
		########### All permutations of rest of chars residesd in rest_set
		rest_set = rest.shift.product(*rest).map(&:join)
		next if rest_set.nil?
		results[i] = [(first_set & dictionary), (rest_set & dictionary)]
	end
	######################
	word_pool = []
	results.each do |key, set|
		next if set.first.nil? || set.last.nil?
		set.first.product(set.last).each do |words|
		word_pool << words
	end
	end
	##########################
	word_pool << (letter_pool.shift.product(*letter_pool).map(&:join) & dictionary).join(", ")
	word_pool
end

def conductor digits
	if validator digits.to_s
		puts "Valid format, proceeding further to map and find words"
		letter_pool = mapper digits.to_s
		words = wordsmith letter_pool
		if (!words.nil?) && (words.length > 0)
			puts words.flatten.uniq
		else
			puts "There is a problem with the output for the combination"
		end
	else
		puts "Your number doesn't follow rules - "
	end
end
end