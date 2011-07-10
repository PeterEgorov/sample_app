class VacanciesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def new
    @title = "New"
  end
  
  def index
    @title = "All vacancies"
    @vacancies = Vacancy.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @title = "Show"
    @vacancy = current_user.vacancies.find(:id)
  end
  
  def create
    @title = "Create"
    @vacancy  = current_user.vacancies.build(params[:vacancy])
    if @vacancy.save
      flash[:success] = "Vacancy created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
  
  def edit
    @title = "Edit"
  end
  
  def update
    @title = "Update"
  end
  
  def destroy
    @vacancy.destroy
    redirect_back_or root_path
  end
  
  private
  
  def authorized_user
      @vacancy = current_user.vacancies.find_by_id(params[:id])
      redirect_to root_path if @vacancy.nil?
    end
  
end
