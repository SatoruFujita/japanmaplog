class PagesController < ApplicationController
  def index
    #ログインしている場合にユーザーIDからそのユーザーのもつ記事を配列でとってjson(都道府県名、記事回数)で返す
    if logged_in?
      articles = Article.where(user_id: current_user.id)

      data ={}
      Prefecture.all.each do |prefecture|
        data["#{prefecture.name}"] = articles.where(prefecture_id: prefecture.id).count()
      end

      binding.pry

    end
  end
end
