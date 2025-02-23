# Run-length encoding is a fast and simple method of encoding strings.

# The basic idea is to represent repeated successive characters as a single count
# and character. For example, the string "AAAABBBCCDAA" would be encoded as
# "4A3B2C1D2A".

# Implement run-length encoding and decoding. You can assume the string to be
# encoded have no digits and consists solely of alphabetic characters. You can
# assume the string to be decoded is valid.

# ---


def encode(str)
	return '' if str.empty?

	current = str[0]
	current_count = 1
	encoded = ''

	str.each_char.with_index do |char, index|
		next if index == 0

		if current == char
			current_count += 1
		else
			encoded << "#{current_count}#{current}"
			current = char
			current_count = 1
		end
		encoded << "#{current_count}#{char}" if index + 1 == str.length
	end
	encoded
end

def decode(str)
	return '' if str.empty?

	matches = []
	new_str = str.gsub(/\d+/) do |match|
		matches.push(match)
		''
	end
	decoded = ''
	new_str.each_char.with_index do |char, index|
		decoded << char * matches[index].to_i
	end
	decoded
end

# test
string_to_encode = 'AAAABBBCCDAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'

encoded_string = encode(string_to_encode)
decode(encoded_string) == string_to_encode
