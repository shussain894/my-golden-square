def make_snippet(str)
  snippet_array = str.split(",")
  if snippet_array.length > 5
    five_word_array = snippet_array[0..4].join(',')
    "#{five_word_array}..."
    #five_word_array +"..."
  else
    str
  end
end

make_snippet("")


def count_words(string)
  word_count = string.split(" ").length
end


