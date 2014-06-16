class Postcode < ActiveRecord::Base
    has_many :electorates_postcodes
    has_many :electorates, :through => :electorates_postcodes
    has_many :representatives, :through => :electorates
    has_and_belongs_to_many :suburbs
end
