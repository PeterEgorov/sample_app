class VacanciesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => [:create, :destroy]
  
  def new
    @title = "New"
    @vacancy = Vacancy.new
  end
  
  def index
    @title = "All vacancies"
    @vacancies = Vacancy.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @title = "Show vacancy"
    #@user = current_user #User.find(params[:id])
    @vacancy = Vacancy.find_by_id(params[:id]) 
  end
  
  def create
    @title = "Create"
    @vacancy  = current_user.vacancies.build(params[:vacancy])
    if @vacancy.save
      flash[:success] = "Vacancy created!"
      redirect_to vacancies_path
    else
      #not working :((
      flash[:error] = "Vacancy not created!"
      @vacancy.title.clear
      @vacancy.text.clear
      render 'new'
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
    redirect_to vacancies_path
  end
  
  private
  
  def authorized_user
      @vacancy = current_user.vacancies.find_by_id(params[:id])
      redirect_to root_path if @vacancy.nil?
    end
  
end
