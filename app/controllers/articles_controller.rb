class ArticlesController < ApplicationController
  protect_from_forgery except: :create
  require 'geocoder'
  require 'exifr/jpeg'
  const Domain = "@japanmaplog.work"
  def create
    imageFile = params['attachment1']


    @article = Article.new(
      title: params[:subject],
      body: params[:text],
      image: imageFile,
      user_id: (params[:to].tr(Domain, "").tr("post","")).to_i
    )

    #緯度経度のない画像の場合のケアは必要
    latitude = EXIFR::JPEG::new(@article.image.file.file).gps.latitude
    longitude = EXIFR::JPEG::new(@article.image.file.file).gps.longitude

    #日本語に設定
    Geocoder.configure(:language => :ja)

    addressArray = Geocoder.address("#{latitude}, #{longitude}").split(',')
    addressIndex = addressArray.index_select {|v| v =~  /(東京都|北海道|(?:京都|大阪)府|.{2,3}県)/}[0]

    prefectureData = Prefecture.find_by("name= '#{addressArray[addressIndex].strip.gsub(/[都府県]/, "")}'")

    #binding.pry
    @article.prefecture_id = prefectureData.id

    if @article.save
      render :json => {"article" => "RIGHT"}, :status => 200
    else
    end
  end

  def index
      #ログインしている自分の記事を見る
      #シェアできるようにする機能も欲しい
      @articles = Article.where(user_id: current_user.id).order(:prefecture_id)
  end

  def show
    @articles = Article.where(user_id: params[:id]).order(:prefecture_id)
  end
end

class Array
 def index_select(obj = nil)
    if obj.nil? && !block_given?
      self.each
    else
      proc = obj.nil? ? -> (i){ yield self[i]} : -> {self[i] == obj}
      self.each_index.select(&proc)
    end
 end
end
