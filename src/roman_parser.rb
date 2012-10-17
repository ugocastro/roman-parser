require "../src/invalid_number_exception.rb"
require "../src/string.rb"

class RomanParser

	def self.to_arabic roman_number
		raise InvalidNumberException unless valid? roman_number

		index = 0
		arabic_number = 0
		symbols = roman_number.split(//)

		while index < roman_number.size
			number = to_number symbols[index]
			index = index.next

			if index == roman_number.size
				arabic_number += number
			else
				next_number = to_number symbols[index]

				if next_number > number
					arabic_number += next_number - number
					index = index.next
				else
					arabic_number += number
				end
			end
		end

		arabic_number
	end

	private

	def self.valid? roman_number
		if (roman_number.class != String || roman_number.empty?)
			false
		else
			roman_number.validate %r[^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$]
		end
	end

	def self.to_number symbol
		case symbol
			when 'I'
				1
			when 'V'
				5
			when 'X'
				10
			when 'L'
				50
			when 'C'
				100
			when 'D'
				500
			when 'M'
				1000
		end
	end

end