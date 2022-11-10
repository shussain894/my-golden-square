def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    p char 
    counter[char] += 1
    p counter 
  end
  sorted_chars = counter.to_a.sort_by { |k, v| v }
  if sorted_chars[-1][0] == " " then return sorted_chars[-2][0]
  end
end
  
  # Intended output:
  # 
  p get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"