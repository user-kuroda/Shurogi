class Category < ActiveRecord::Base
  has_many :items
  belongs_to :user

  validates_uniqueness_of :categoryname, :message => "は既に登録されています"
end
