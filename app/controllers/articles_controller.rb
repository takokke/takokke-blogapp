class ArticlesController < ApplicationController
    before_action :set_article, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = current_user.articles.build
    end

    def create
        @article = current_user.articles.build(article_params)

        #saveはDBにインスタンスを保存するメソッド
        if @article.save
            #保存した記事の詳細ページを映す
            redirect_to article_path(@article), notice: '保存しました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new        #このメソッド内の@articleがnew.html.erbに引き継がれる
        end
    end

    def edit
        @article = current_user.articles.find(params[:id])
        #redirect_to new_article_path unless @articles
    end

    def update
        @article = current_user.articles.find(params[:id])
        #redirect_to new_article_path unless @articles
        if @article.update(article_params)      # updateメソッド実行
            redirect_to article_path(@article), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit         #このメソッド内の@articleがedit.html.erbに引き継がれる
        end
    end

    def destroy
        article = current_user.articles.find(params[:id])
        article.destroy!
        redirect_to root_path, notice: '削除しました'
    end

    private
    # ブラウザからサーバへ送られるデータ(params)のうち、titleとcontentのみサーバは保存する
    # Strong Parameterを返却するメソッド
    def article_params
        params.require(:article).permit(:title, :content)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
