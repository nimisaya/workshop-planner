class User < ApplicationRecord
     # Use the bcrypt gem to encrypt passwords when user creates account, and store only the encrypted version in the 'users' table
    has_secure_password
end
