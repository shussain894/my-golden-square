class GrammarStats
  def initialize
    @check_count = 0
    @success_count = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.

    @check_count += 1 # this ensure we are counting how many checks we are doing, check are being passed in the rspec in line 31 for eg
    if text == "" then return false end
    last_letter = text[-1]
    if text[0].upcase == text[0] && [".", "!", "?"].include?(last_letter)
      @success_count += 1 # this counter is counting how many successful times the tests are passing, seeing if it meets the above code
      true
    else
      false
    end 
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.

    ((@success_count / @check_count.to_f) * 100).round 
  end
end