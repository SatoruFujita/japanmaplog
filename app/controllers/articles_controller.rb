class ArticlesController < ApplicationController
  def index
      #ログインしている自分の記事を見る
      @articles = Articles.where(user_id = current_user.id)


  end
end
