class User < ActiveRecord::Base
  belongs_to :profile
  belongs_to :address
end
