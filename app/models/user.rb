class User < ApplicationRecord
  has_many :movements
  has_secure_password
end
