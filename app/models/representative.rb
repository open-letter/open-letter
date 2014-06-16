class Representative < ActiveRecord::Base
    belongs_to :electorate
    belongs_to :profile
    belongs_to :address
    attr_accessor :electorate_percent
end
