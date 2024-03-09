dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def substrings(str, arr)
  hash = Hash.new(0)
  str = str.downcase.gsub(/[^a-z\s]/, '')
  arr.each do |word|
    index = 0
    while index = str.index(word, index)
      hash[word] += 1
      index += 1
    end
  end
  return hash
end

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
