class Number < ActiveRecord::Base
validates :or, :presence => true
validates :or, :uniqueness => true
end
