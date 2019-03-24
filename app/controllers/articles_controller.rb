class ArticlesController < ApplicationController
  protect_from_forgery except: :create
  #require 'exifr/jpeg'
  def create
    #画像の情報を取得して都道府県名を取る
    imageFile = params['attachment1']
    #@param_exif_lat = EXIFR::JPEG.new(@imageFile['filename']).gps.latitude
    #@param_exif_lot = EXIFR::JPEG.new(@imageFile['filename']).gps.longitude

    #Geocoder.configure(:language => :ja)
    #@address_name = Geocoder.address(@param_exif_lat, @param_exif_lot)
    #@prefecture_name  = @address_name.match(/.*[都道府県]/).to_s
    #住所から都道府県名を抜き出し、PrefectureテーブルからIDをとる

    prefectureId = @prefecureId

    @article = Article.new(
      title: params[:subject],
      body: params[:text],
      image: imageFile,
      prefecture_id: prefectureId,
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
