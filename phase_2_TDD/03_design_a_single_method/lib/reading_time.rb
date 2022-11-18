def reading_time(text)
  word_count = (text.split(" ").length).to_f/200
  word_count.ceil
end
