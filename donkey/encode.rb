require 'awesome_print'

CHAR_WIDTH = 3
CHAR_HEIGHT = 3
CHARS_IN_ROW = 10
CHARS_IN_COL = 10
MATRIX_WIDTH = CHARS_IN_ROW * (CHAR_WIDTH + 1) + 30
MATRIX_HEIGHT =CHARS_IN_COL * (CHAR_HEIGHT + 1) + 30
MATRIX = Array.new(MATRIX_WIDTH){Array.new(MATRIX_HEIGHT, '+')} 

def main
	content = IO.readlines('./text.txt').map(&:chop).join(' ')

	content.each_char.with_index do |char, index|
		process_char(char, index)
		debug
		p '-------------------------------'
	end

	
end

def process_char(char, index)
	matrix_char = to_matrix_char(char)
	row, col = matrix_position(index)
	#debug_char(matrix_char)
	insert(matrix_char, row, col)
end

def to_matrix_char(char)
	bin = char.force_encoding("cp1251").ord.to_s(2).rjust(8, '0')
	[
		[bin[0], bin[1], bin[2]],
		[bin[3], ' ',    bin[4]],
		[bin[5], bin[6], bin[7]],
	]
end

# def draw(char, index)
# 	bin = char.force_encoding("cp1251").ord.to_s(2).rjust(8, '0')
# 	matrix_char = [
# 		[bin[0], bin[1], bin[2]],
# 		[bin[3], ' ',    bin[4]],
# 		[bin[5], bin[6], bin[7]],
# 	]
# end

def matrix_position(index)
	row = (index / (CHARS_IN_ROW * (CHAR_WIDTH + 1))) * (CHAR_HEIGHT + 1)
	col = (index % (CHARS_IN_ROW * (CHAR_WIDTH + 1))) * (CHAR_WIDTH + 1)
	p row, col
	[row, col]
end

def insert(matrix_char, row, col)
	matrix_char.each_with_index do |matrix_char_row, row_index|
		matrix_char_row.each_with_index do |value, col_index|
			MATRIX[row + row_index][col + col_index] = value
		end
	end
end

def debug_char(matrix_char)
	matrix_char.each do |row|
		p row.join('')
	end
	p ''
end

def debug
	MATRIX.each do |row|
		p row.join('')
	end
end

main