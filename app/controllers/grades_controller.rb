class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  def index
    
    if !user_signed_in?
      redirect_to user_session_path
    end
    if params[:sort] == "Asc"
      @grades = Grade.all.order("student_grade").reverse
    elsif params[:sort] == "Desc"
      @grades = Grade.all.order("student_grade")
    else
      @grades = Grade.all
    end 
  end

  # GET /grades/1
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  def sort
    @grades = Grade.all.order("student grade")

  end
    

  # POST /grades
  def create
    @grade = Grade.new(grade_params)
    if current_user.account_id == 1 or current_user.account_id == 0
      if @grade.save
        redirect_to @grade, notice: "Grade was successfully created."
      else
        render :new
      end
    else
      redirect_to grades_url, notice: 'User is not authorized.'
    end
  end
  # PATCH/PUT /grades/1
  def update
    if current_user.account_id == 1 or current_user.account_id == 0
      if @grade.update(grade_params)
        redirect_to @grade, notice: 'Grade was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to grades_url, notice: 'User is not authorized.'
    end
  end

  # DELETE /grades/1
  def destroy
    if current_user.account_id == 1
      @grade.destroy
      redirect_to grades_url, notice: 'Grade was successfully destroyed.'
    else
      redirect_to grades_url, notice: 'User is not authorized.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:student_id, :student_name, :student_grade)
    end
end
