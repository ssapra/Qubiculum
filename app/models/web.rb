class Web < ActiveRecord::Base
  attr_accessible :question_id
  
  belongs_to :question
  has_many :answers
end
