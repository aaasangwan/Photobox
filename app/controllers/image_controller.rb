class ImageController < ApplicationController
	# This is to prevent csrf warning
  skip_before_filter :verify_authenticity_token, only: [:add_image]

  def uploader

  end

  def add_image
	image_url = params['url']
	name = image_url.split("/").last.split(".").first  	
	@u = Image.new(name: name, url: image_url)
	p @u.save!
	render nothing: true
	# Run rails c and check for Image.all.last
  end
end
