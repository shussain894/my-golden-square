def checking_grammar(text)
  if text == "" then return false end
  first_letter = text[0]
  last_letter = text[-1]
  if first_letter == first_letter.capitalize && [".", "!", "?"].include?(last_letter)
    true
  else
    false 
  end
  
end 