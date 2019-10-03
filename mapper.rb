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


def conductor digits
if validator(digits.to_s)
puts "Valid format, proceeding further to map"
else
puts "Your number doesn't follow rules - "
end
end

end