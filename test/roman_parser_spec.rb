require "../src/invalid_number_exception.rb"
require "../src/roman_parser.rb"

describe "RomanParser" do

	describe "#to_arabic" do

		it "should raise InvalidNumberException to empty entries" do
			expect{RomanParser.to_arabic ""}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to nil entries" do
			expect{RomanParser.to_arabic nil}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 123 because it's not String" do
			expect{RomanParser.to_arabic 123}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'C I ' because it has blank spaces" do
			expect{RomanParser.to_arabic "C I "}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'CxiX' because it has lowercase symbols" do
			expect{RomanParser.to_arabic "CxiX"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'H' because it's not a roman symbol" do
			expect{RomanParser.to_arabic "H"}.to raise_error(InvalidNumberException)
		end

		it "should return 1 to 'I'" do
			expect(RomanParser.to_arabic "I").to eql(1)
		end

		it "should return 5 to 'V'" do
			expect(RomanParser.to_arabic "V").to eql(5)
		end

		it "should return 10 to 'X'" do
			expect(RomanParser.to_arabic "X").to eql(10)
		end

		it "should return 50 to 'L'" do
			expect(RomanParser.to_arabic "L").to eql(50)
		end

		it "should return 100 to 'C'" do
			expect(RomanParser.to_arabic "C").to eql(100)
		end

		it "should return 500 to 'D'" do
			expect(RomanParser.to_arabic "D").to eql(500)
		end

		it "should return 1000 to 'M'" do
			expect(RomanParser.to_arabic "M").to eql(1000)
		end

		it "should return 1944 to 'MCMXLIV'" do
			expect(RomanParser.to_arabic "MCMXLIV").to eql(1944)
		end

		it "should return 2012 to 'MMXII'" do
			expect(RomanParser.to_arabic "MMXII").to eql(2012)
		end

		it "should return 3023 to 'MMMXXIII'" do
			expect(RomanParser.to_arabic "MMMXXIII").to eql(3023)
		end

		it "should return 1999 to 'MCMXCIX'" do
			expect(RomanParser.to_arabic "MCMXCIX").to eql(1999)
		end

		it "should raise InvalidNumberException to 'XVV' because 'V' can't repeat" do
			expect{RomanParser.to_arabic "XVV"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'LL' because 'L' can't repeat" do
			expect{RomanParser.to_arabic "LL"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MDDXVI' because 'D' can't repeat" do
			expect{RomanParser.to_arabic "MDDXVI"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MCXXIIII' because 'I' can repeat maximum 3 times" do
			expect{RomanParser.to_arabic "MCXXIIII"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MMCXXXX' because 'V' can repeat maximum 3 times" do
			expect{RomanParser.to_arabic "MMCXXXX"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MMCCCCIV' because 'C' can repeat maximum 3 times" do
			expect{RomanParser.to_arabic "MMCCCCIV"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MMMMIV' because 'M' can repeat maximum 3 times" do
			expect{RomanParser.to_arabic "MMMMIV"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MIM' because 'I' can be subtracted from 'V' and 'X' only" do
			expect{RomanParser.to_arabic "MIM"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MXD' because 'X' can be subtracted from 'L' and 'C' only" do
			expect{RomanParser.to_arabic "MXD"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MVC' because 'V' can't be subtracted" do
			expect{RomanParser.to_arabic "MVC"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'MLCI' because 'L' can't be subtracted" do
			expect{RomanParser.to_arabic "MLCI"}.to raise_error(InvalidNumberException)
		end

		it "should raise InvalidNumberException to 'DM' because 'D' can't be subtracted" do
			expect{RomanParser.to_arabic "DM"}.to raise_error(InvalidNumberException)
		end

	end

end