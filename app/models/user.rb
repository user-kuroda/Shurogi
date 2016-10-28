class User < ActiveRecord::Base
 has_many :categories
 has_many :items

 validates :userid,presence: true, format: { with: /\A[a-z0-9]+\z/i }
 validates :name,presence: true
 validates :pass,presence: true, format: { with: /\A[a-z0-9]+\z/i }
 validates :mail,presence: true, format: { with: /\A[a-z0-9]+\z/i }
 validates :call,presence: true
 validates_uniqueness_of :userid, :message => "は既に使用されています"

 validates_confirmation_of :pass  
 attr_accessor :pass_confirmation  

  def self.authenticate(userid, pass)
    usr = find_by(userid: userid)
    if usr != nil && usr.pass == pass then
      usr
    else
      return
    end
  end

end
