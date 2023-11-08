class PhotosController < ApplicationController
  def index
    @allphotos = Photo.all
    render({ :template => "photo_templates/index"})
  end

  def add_photo
    @the_photo = Photo.new
    @the_photo.caption = params.fetch('input_caption')
    @the_photo.image = params.fetch('input_image')
    @the_photo.owner_id = params.fetch('input_id')

    @the_photo.save
    redirect_to('/photos')
  end

  def update_user
    update_user_id = params.fetch('user_id')
    @the_user = User.where({:id => update_user_id}).first
    @the_user.username = params.fetch('input_username')
    @the_user.save
    redirect_to("/users/#{update_user_id}")
  end

  def details
    photo_id = params.fetch('photo_id')
    @photo = Photo.where({:id => photo_id}).first
    render({:template => "photo_templates/photo_detail"})
  end
end
