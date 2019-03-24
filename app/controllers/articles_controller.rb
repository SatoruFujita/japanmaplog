class ArticlesController < ApplicationController
  protect_from_forgery except: :create
  #require 'exifr/jpeg'
  def create
    imageFile = params['attachment1']

    @article = Article.new(
      title: params[:subject],
      body: params[:text],
      image: imageFile,
      prefecture_id: @prefecureId,
      user_id: (params[:to].tr("@Japanmaplog.xyz", "").tr("post","")).to_i
    )
    if @article.save
      render :json => {"article" => "RIGHT"}, :status => 200
    else
    end
  end

  def index
      #ログインしている自分の記事を見る
      #将来的には引数を用意してそれぞれのユーザーの記事を観れるようにする
      @articles = Article.where(user_id: current_user.id)
  end
end
