class ElectoratesPostcode < ActiveRecord::Base
  belongs_to :electorate
  belongs_to :postcode
end
