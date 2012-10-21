class Question < ActiveRecord::Base
  attr_accessible :section_id, :title
  
  belongs_to :section
  has_many :webs
  
end
