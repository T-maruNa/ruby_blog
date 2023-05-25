class BlogsController < ApplicationController
    # 記事の一覧表示
    def index
        @blogs = Blog.all
    end

    # 記事の表示
    def show
        @blog = Blog.find(params[:id])
    end
    # 記事の作成
    def new
        @blog = Blog.new
    end

    # 記事の登録
    def create
        #データを新規登録するためのインスタンス生成
        @blog = Blog.new(blog_params)

        # BlogモデルをDBへ保存
        if @blog.save
            # showアクションにリダイレクト
            redirect_to @blog
        else
            # 作成ページに遷移する
            render 'new'
        end
    end

    # コントローラパラメータの定義
    private
    def blog_params
        params.require(:blog).permit(:title, :text)
    end

    # 記事の編集
    def edit
        @blog = Blog.find(params[:id])
    end

    # 記事の更新
    def update
        @blog = Blog.find(params[:id])

        # DBに登録できた場合
        if @blog.update(article_params)
            # 記事ページに遷移する
            redirect_to @article
        # DBに登録できなかった場合
        else
            # 編集ページに遷移する
            render 'edit'
        end
    end

    # 記事の削除
    def destroy
        @blog = Blog.find(params[:id])

        # 記事の削除
        @blog.destroy

        # TOPページに遷移する
        redirect_to blog_path
    end
end
