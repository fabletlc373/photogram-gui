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
    redirect_to("/users/#{new_username}")
  end

  def update_user
    update_user_id = params.fetch('user_id')
    @the_user = User.where({:id => update_user_id}).first
    @the_user.username = params.fetch('input_username')
    @the_user.save
    redirect_to("/users/#{params.fetch('input_username')}")
  end

  def details
    username = params.fetch('username')
    @user = User.where({:username => username}).first
    render({:template => "user_templates/user_detail"})
  end
end
