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
            render :new        #このメソッド内の@articleがnew.html.erbに引き継がれる
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id]) # 何番のidのレコードを更新しようとしているのか把握する
        if @article.update(article_params)      # updateメソッド実行
            redirect_to article_path(@article), notice: '更新できました'
        else
            flash.now[:error] = "更新できませんでした"
            render :edit         #このメソッド内の@articleがedit.html.erbに引き継がれる
        end
    end
    private
    # ブラウザからサーバへ送られるデータ(params)のうち、titleとcontentのみサーバは保存する
    # Strong Parameterを返却するメソッド
    def article_params
        params.require(:article).permit(:title, :content)
    end
end