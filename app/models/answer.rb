class Answer < ActiveRecord::Base
  attr_accessible :content, :votes, :web_id, :question_id
  
  def question
    Question.find_by_id(self.question_id)
  end
end
