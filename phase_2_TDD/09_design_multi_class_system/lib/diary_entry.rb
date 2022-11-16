class DiaryEntry
  def initialize(title, contents, mobile)
    @contents = contents
    @title = title
    @mobile = mobile
  end

  def contents
    @contents
  end 

  def title
    @title
  end
  
  def mobile
    @mobile
  end 

  def word_count
    contents.split.length
  end

end