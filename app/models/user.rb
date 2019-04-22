class User < ActiveRecord::Base
    has_many :reports
    has_secure_password
end
