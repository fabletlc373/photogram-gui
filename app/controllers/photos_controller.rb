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
    redirect_to("/photos/#{@the_photo.id}")
  end

  def delete_photo
    @photo_id = params.fetch('photo_id')
    @the_photo = Photo.where({:id => @photo_id}).first
    @the_photo.destroy
    redirect_to('/photos')
  end

  def update_photo
    update_photo_id = params.fetch('photo_id')
    @the_photo = Photo.where({:id => update_photo_id}).first
    @the_photo.image = params.fetch('input_image')
    @the_photo.caption = params.fetch('input_caption')
    @the_photo.save
    redirect_to("/photos/#{update_photo_id}")
  end

  def details
    photo_id = params.fetch('photo_id')
    @photo = Photo.where({:id => photo_id}).first
    render({:template => "photo_templates/photo_detail"})
  end

  def add_comment
    new_comment = Comment.new
    new_comment.photo_id = params.fetch('input_pid')
    new_comment.body = params.fetch('input_comment')
    new_comment.author_id = params.fetch('input_aid')
    new_comment.save
    redirect_to("/photos/#{params.fetch('input_pid')}")
  end
end
