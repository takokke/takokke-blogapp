class HomeController < ApplicationController
    def index
      @title = 'blogapp'
      render 'home/index'
    end

    def about
      render 'home/about'
    end
end