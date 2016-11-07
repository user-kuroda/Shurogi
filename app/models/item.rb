class Item < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user

  validates :itemname,presence: true
  validates :situ,inclusion:{in: [true, false]}


end
