class ArticlesController < ApplicationController
  protect_from_forgery except: :create
  require 'geocoder'
  require 'exifr/jpeg'
  def create
    imageFile = params['attachment1']

    @article = Article.new(
      title: params[:subject],
      body: params[:text],
      image: imageFile,
      #prefecture_id: @prefecureId,
      user_id: (params[:to].tr("@Japanmaplog.xyz", "").tr("post","")).to_i
    )

    #緯度経度のない画像の場合のケアは必要
    latitude = EXIFR::JPEG::new(@article.image.file.file).gps.latitude
    longitude = EXIFR::JPEG::new(@article.image.file.file).gps.longitude

    #日本語に設定
    Geocoder.configure(:language => :ja)
    address = Geocoder.address("#{latitude}, #{longitude}").split(',')[2].strip
    prefectureData = Prefecture.find_by("name= '#{address}'")

    @article.prefecture_id = prefectureData.id

    binding.pry
    if @article.save
      render :json => {"article" => "RIGHT"}, :status => 200
    else
    end
  end

 private
 def getPrefectureId

 end


  def index
      #ログインしている自分の記事を見る
      #将来的には引数を用意してそれぞれのユーザーの記事を観れるようにする
      @articles = Article.where(user_id: current_user.id)
  end
end
