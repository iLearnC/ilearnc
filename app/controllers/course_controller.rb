class CourseController < ApplicationController
  include UsersHelper

  def course
    @skilltypes = Skilltype.all
    render 'addcourse'
  end

  def addcourse
    @skill = Skill.new(course_params)
    @skill[:user_id] = session[:userId]
    if @skill.save
      redirect_to :controller => 'index', :action => 'index'
    else
      render 'addcourse'
    end
  end

  def allcourse
    @skills = Skill.all
  end

  def singlecourse
    @skill = Skill.find(params['id'])
    render 'singlecourse'
  end

  private
    def course_params
      params.require(:skill)
        .permit(:title, :description, :teacher, :skill_type, :start_date, :end_date, :head_count)
    end
end
