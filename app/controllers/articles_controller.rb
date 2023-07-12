class ArticlesController < ApplicationController
    def index
        # render 'articles/index'
        @articles = Article.all #一覧を表示するときはindexを使う   
    end

    def show
        @article = Article.find(params[:id])
    end
end