MORSE_TO_LETTER = {
  '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G',
  '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N',
  '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S',
  '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z'
}

def get_char(char)
  MORSE_TO_LETTER[char] || nil
end

puts "\"#{get_char('.-')}\"" #=> "A"

def decode_word(morse_word)
  morse_word.split.map { |char| get_char(char) }.join('')
end

puts "\"#{decode_word('-- -.--')}\"" #=> "MY"

def decode_sentence(morse_sentence)
 morse_sentence.split('   ').map { |morse_word| decode_word(morse_word) }.join(' ')
end

morse_sentence1 = '.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...'
morse_sentence2 = '-- -.--   -. .- -- .'

decoded_sentence1 = decode_sentence(morse_sentence1)
decoded_sentence2 = decode_sentence(morse_sentence2)

puts "\"#{decoded_sentence1}\"" #=> "A BOX FULL OF RUBIES"
puts "\"#{decoded_sentence2}\"" #=> "MY NAME"

module Cream
  def cream?
    true
  end
end

class Cookies
  include Cream
end

cookie = Cookies.new
p cookie.cream?