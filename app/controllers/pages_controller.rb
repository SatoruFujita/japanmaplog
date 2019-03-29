class PagesController < ApplicationController
  def index
    #ログインしている場合にユーザーIDからそのユーザーのもつ記事を配列でとってjson(都道府県名、記事回数)で返す
    if logged_in?
      articles = Article.where(user_id: current_user.id)

      @prefecture_data ={}
      @prefecture_data["都道府県"] = "回数"
      Prefecture.all.each do |prefecture|
        @prefecture_data["#{prefecture.name}"] = articles.where(prefecture_id: prefecture.id).count()

      end
      @prefecture_data_json = @prefecture_data.to_json.html_safe
    end
  end
end
