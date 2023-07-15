class ArticlesController < ApplicationController
    def index
        # render 'articles/index'
        @articles = Article.all #一覧を表示するときはindexを使う
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new()
    end

    def create
        @article = Article.new(article_params)
        #saveはDBにインスタンスを保存するメソッド
        if @article.save 
            #保存した記事の詳細ページを映す
            redirect_to article_path(@article), notice: '保存しました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    private
    # ブラウザからサーバへ送られるデータ(params)のうち、titleとcontentのみサーバは保存する
    # Strong Parameterを返却するメソッド
    def article_params
        params.require(:article).permit(:title, :content)
    end
end