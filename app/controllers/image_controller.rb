class ImageController < ApplicationController
	# This is to prevent csrf warning
  skip_before_filter :verify_authenticity_token, only: [:add_image]

  def index
  	@images = Image.all
  end
  def uploader

  end
  def index
  	#@images = Image.all
  	#render_template (:file => "#{Rails.root}/app/views/image/index")
  end

  def add_image
	image_url = params['url']
	name = image_url.split("/").last.split(".").first  	
	@u = Image.new(name: name, url: image_url)
	p @u.save!
	render nothing: true
	# Run rails c and check for Image.all.last
  end

  def show 
  	#@images = Image.all

  end
end
