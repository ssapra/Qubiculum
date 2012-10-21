class Section < ActiveRecord::Base
  attr_accessible :course_id, :number, :professor
  
  has_many :questions
  belongs_to :course
  
end
