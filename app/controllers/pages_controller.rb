class PagesController < ApplicationController
  def home
    @title = "Главная"
  end

  def contact
    @title = "Контакты"
  end

  def about
    @title = "About"
  end

end
