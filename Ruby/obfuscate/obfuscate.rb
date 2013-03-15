# If this were for purposes of cleaning out
# offensive words it would be easier to just use gsub
# but in this case we want to preserve things like "bigger"
# when searching for "big"

# also the challenge was using an array as the second argument
# where this takes an unlimited number of params. Each param passed
# after the first is a string we want to obfuscate

# Alternative solution below that allows the words param to be
# an array or a string. If passing words in string form
# they should be space seperated.

# Replace words = words.to_a
# with words = words.split(' ') if !words.is_a?(Array)
# Remove the * from the words param


# METHOD 1 (Infinite Params)
# ------------------------------------------------------------------
def obfuscate(phrase = '', *words)
  words = words.to_a
  words.split(' ') if !words.is_a?(Array)
  phrase = phrase.split(' ')
  words.each do |word|
    phrase.collect {|item| item.replace('*' * item.length) if item.downcase == word.downcase}
  end
  phrase.join(" ")
end

def report(phrase = '', *words)
  words = words.to_a
  phrase = phrase.split(' ')
  matches = []
  occurrences = Hash.new(0)

  words.each do |word|
    phrase.collect {|item| matches << item if item.downcase == word.downcase}
  end

  matches.each do |match|
    occurrences[match.downcase] += 1
  end
  occurrences
end



# METHOD 2 (words as an array)
# ------------------------------------------------------------------
def obfuscate_array(phrase = '', words)
  words.split(' ') if !words.is_a?(Array)
  phrase = phrase.split(' ')
  words.each do |word|
    phrase.collect {|item| item.replace('*' * item.length) if item.downcase == word.downcase}
  end
  phrase.join(" ")
end

def report_array(phrase = '', words)
  words = words.to_a
  phrase = phrase.split(' ')
  matches = []
  occurrences = Hash.new(0)

  words.each do |word|
    phrase.collect {|item| matches << item if item.downcase == word.downcase}
  end

  matches.each do |match|
    occurrences[match.downcase] += 1
  end
  occurrences
end