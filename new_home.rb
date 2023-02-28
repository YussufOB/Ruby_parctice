class MorseDecoder
  MORSE_TO_LETTER = {
    '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G',
      '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N',
      '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S',
      '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z'
  }

  def self.get_char(morse_code)
    MORSE_TO_LETTER[morse_code] || ''
  end

  def self.decode_word(morse_words)
    morse_words.split.map { |morse_code| get_char(morse_code) }
  end

  def self.decode_morse(morse_code)
    morse_code.split('   ').map { |morse_words| decode_word(morse_words).join('') }
  end
end

morse_sentence1 = '.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...'
morse_sentence2 = '-- -.--   -. .- -- .'

decoded_sentence1 = MorseDecoder.decode_morse(morse_sentence1)
decoded_sentence2 = MorseDecoder.decode_morse(morse_sentence2)

puts "#{decoded_sentence1}" #=> "A BOX FULL OF RUBIES"
puts "#{decoded_sentence2}" #=> "MY NAME"