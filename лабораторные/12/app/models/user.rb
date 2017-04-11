class User < ActiveRecord::Base

def self.authenticate(log, pass)
  user = find_by_login(log)
  return nil if user.nil?
  return user if user.pswd == pass
end

end
