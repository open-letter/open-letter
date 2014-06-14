class Representative < ActiveRecord::Base
  belongs_to :profile
  belongs_to :address
end
