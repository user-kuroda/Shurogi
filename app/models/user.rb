class User < ActiveRecord::Base

validates_confirmation_of :pass  
attr_accessor             :pass_confirmation  

end
