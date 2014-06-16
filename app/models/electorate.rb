class Electorate < ActiveRecord::Base
    has_many :electorates_postcodes
    has_many :postcodes, :through => :electorates_postcodes
end
