class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :login, presence: true, uniqueness: true, :length => { :in => 5..20 }
  validates :password, presence: true, :length => { :in => 5..20 }
end
