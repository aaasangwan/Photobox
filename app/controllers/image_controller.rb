class ImageController < ApplicationController
	# This is to prevent csrf warning
  skip_before_filter :verify_authenticity_token, only: [:add_image]

  def upload
    @image = Image.new
    if request.post? && !params[:image][:picture].nil?
      temp_path = params[:image][:picture].tempfile
      upload = Cloudinary::Uploader.upload(temp_path)
      p image_url = upload["url"]
      p name = image_url.split("/").last.split(".").first
      @u = Image.new(name: name, url: image_url)
      p @u.save!
      render html: "Sucessfull"
    end
  end

  def index
  	@images = Image.all
  	#render_template (:file => "#{Rails.root}/app/views/image/index")
  end

  def add_image
    # url form http://p.imgci.com/db/PICTURES/CMS/193700/193739.jpg
	image_url = params['url']
	name = image_url.split("/").last.split(".").first
	@u = Image.new(name: name, url: image_url)
	p @u.save!
	render nothing: true
	# Run rails c and check for Image.all.last
  end

  def show
  	@images = Image.all
    image = @images.map{|image|{name: image.name, url: image.url}}
    render json: image
  end
end
