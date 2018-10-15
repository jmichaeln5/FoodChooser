class PagesController < ApplicationController

  def home
    if current_user
      redirect_to current_user
    end
  end

  def login
  end

  def register
  end

  def about
  end
end
