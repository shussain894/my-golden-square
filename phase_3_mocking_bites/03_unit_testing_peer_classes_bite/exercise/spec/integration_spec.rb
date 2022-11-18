require 'secret_diary'
require 'diary'

RSpec.describe "integration" do
  context "at first" do 
    it "does not read diary as it is locked" do
      diary = Diary.new("contents")
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }. to raise_error "Go away!"
    end
  end

  context "when unlocked it reads contents" do
    it "reads the diary" do
      diary = Diary.new("contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock 
      expect(secret_diary.read).to eq "contents"
    end
  end 

  context "when locked again" do
    it "does not read the diary" do
      diary = Diary.new("contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock 
      secret_diary.lock 
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end 
end 