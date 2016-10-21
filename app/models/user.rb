class User < ActiveRecord::Base

 validates_confirmation_of :pass  
 attr_accessor             :pass_confirmation  

  def self.authenticate(userid, pass)
    usr = find_by(userid: userid)
    if usr != nil && usr.pass == pass then
      usr
    else
      return
    end
  end

end
