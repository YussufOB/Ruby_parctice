def get_char(char)
  morse_dict = {
    '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G',
    '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N',
    '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S',
    '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z'
  }
  morse_dict[char] || nil
end

def get_word(arr)
  word = []
  detach_arr = arr.split
  detach_arr.each do |i, index|
    word.push(get_char(i))
    word.push(' ') unless index == detach_arr.length - 1
  end
  word.join
end

def decode(sentence)
  statement = []
  split_sentence = sentence.split(' ')
  split_sentence.each do |i|
    statement.push(get_word(i))
  end
  statement.join
end

x = decode('.- -... --- -..- ..-. ..- .-.. .-.. --- ..-. .-. ..- -... .. . ...')

puts "\"#{x}\""
