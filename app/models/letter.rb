class Letter < ActiveRecord::Base
  belongs_to :letter_thread
  belongs_to :category
  belongs_to :sender :class_name => 'Profile'
  belongs_to :receiver :class_name => 'Profile'
  belongs_to :response :class_name => 'Letter'
end
