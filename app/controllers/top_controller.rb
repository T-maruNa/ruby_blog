class TopController < ApplicationController

    # ブログの一覧取得
    def index
        @blogs = Blog.all
    end

end
