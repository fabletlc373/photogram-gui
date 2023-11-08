class UsersController < ApplicationController
  def homepage
    @allusers = User.all
    render({ :template => "user_templates/index"})
  end

  def add_user
    new_username = params.fetch('new_username')
    @the_user = User.new
    @the_user.username = new_username
    @the_user.save
    redirect_to('/')
  end

  def update_user
    update_user_id = params.fetch('user_id')
    @the_user = User.where({:id => update_user_id}).first
    @the_user.username = params.fetch('input_username')
    @the_user.save
    redirect_to("/users/#{update_user_id}")
  end

  def details
    user_id = params.fetch('user_id')
    @user = User.where({:id => user_id}).first
    render({:template => "user_templates/user_detail"})
  end
end
