# Given a string of round, curly, and square open and closing brackets
# return whether the brackets are balanced (well-formed).

# For example, given the string "([])[]({})", you should return true.

# Given the string "([)]" or "((()", you should return false.

# ---

def well_formed?(string_value)
	matching_brackets = { ')' => '(', ']' => '[', '}' => '{' }
	stack = []

	string_value.each_char do |char|
		if ['(', '[', '{'].include?(char) # is an opening bracket?
			stack.push(char)
		elsif matching_brackets.key?(char) # is a closing bracket?
			return puts 'Not well formed' if stack.empty? || stack.pop != matching_brackets[char]
		end
	end
	puts stack.empty ? 'Not well formed' : 'Well formed'
end
