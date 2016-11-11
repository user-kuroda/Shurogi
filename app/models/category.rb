class Category < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :categoryname, :message => "は既に登録されています"
end
