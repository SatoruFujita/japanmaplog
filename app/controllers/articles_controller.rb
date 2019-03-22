class ArticlesController < ApplicationController
  protect_from_forgery except: :create
  def create
    @article = Article.new(
      title: params[:subject],
      body: params[:text],
      image: params[:'attachment-info'][0][:attachment1][:filename], #500が帰ってきてしまう
      prefecture_id: 1,
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
