class Note < ApplicationRecord
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :make_sure_owner_can_read

  def visible_to
    self.readers.map{|r| r.name}.join(",")
  end

  def visible_to=(comma_string)
    self.readers = comma_string.gsub(" ", "").split(",").map{|u| User.where(name: u)}.map{|e| e[0]}
  end

  private

  def make_sure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
