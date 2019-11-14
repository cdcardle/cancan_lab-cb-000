require 'rails_helper'

RSpec.describe Note, type: :model do
  fixtures :users
  describe 'visible_to=' do
    it "takes a comma separated list of names, trims spaces, and makes those users readers" do
      note = Note.new      
      note.visible_to = 'alice,beth'      
      assert note.readers == [users(:alice), users(:beth)]
    end
  end

  describe "visible_to" do
    it "returns reader names as a comma-separated string" do
      alice = User.create(name: "alice")
      beth = User.create(name: "beth")
      note = Note.new readers: [alice, beth]
      assert note.visible_to == 'alice,beth'
    end
  end
end
