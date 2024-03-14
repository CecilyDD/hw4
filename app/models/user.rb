# app/models/user.rb

class User < ApplicationRecord
  has_secure_password

  # Add any other model code here
  attribute :first_name, :string
  attribute :last_name, :string
end
