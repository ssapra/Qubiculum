class Course < ActiveRecord::Base
  attr_accessible :name, :number, :department_id
  
  belongs_to :department
  has_many :questions
  
  validates :name, :uniqueness => true
end
