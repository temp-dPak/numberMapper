class NumberMapper
def validator digits
puts "Validator - " + digits
if digits.length != 10
return false
elsif digits.nil?
return false
end
return true
end

def mapper digits
alphabets = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
digits.chars.map{|digit| alphabets[digit]}
end

def conductor digits
if validator(digits.to_s)
puts "Valid format, proceeding further to map"
letter_pool = mapper(digits.to_s)
else
puts "Your number doesn't follow rules - "
end
end

end