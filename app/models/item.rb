class Item < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user
  belongs_to :category

  validates :itemname,presence: true
  validates :situ,inclusion:{in: [true, false]}
  validates :ani, presence: true, if: :itemcall_on?
  validates :day,presence: true

  def itemcall_on?
    itemcall == true
  end


end
