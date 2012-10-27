class Question < ActiveRecord::Base
  attr_accessible :section_id, :title, :course_id
  
  belongs_to :course
  has_many :webs
  
end
