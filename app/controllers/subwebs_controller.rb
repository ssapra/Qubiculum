class SubWebsController < ApplicationController
  
  def create
    @subweb = SubWeb.new
    @subweb.question_id = params[:question_id].to_i
    @question = Question.find(@web.question_id)
    respond_to do |format|
      if @web.save
        format.html { redirect_to new_answer_path(@web.id) }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @web = Web.find_by_question_id(params[:question_id].to_i)
    @web.destroy
    
    redirect_to @web.question, notice: "Thread was successfully deleted."
  end
end
