class Representative < ActiveRecord::Base
  belongs_to :boundary
  belongs_to :boundary_postcode
  belongs_to :profile
  belongs_to :address
end
