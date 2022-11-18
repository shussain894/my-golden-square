require 'secret_diary'

RSpec.describe SecretDiary do
  context "at first" do
    it "does not read diary as it is locked" do
      diary = double :diary 
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }. to raise_error "Go away!"
    end
  end

  context "when unlocked" do
    it "reads the diary" do
      diary = double :diary, read: "contents"
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock 
      expect(secret_diary.read).to eq "contents"
    end
  end 

  context "when locked again" do
    it "does not read the diary" do
      diary = double :diary
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock 
      secret_diary.lock
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end 
end