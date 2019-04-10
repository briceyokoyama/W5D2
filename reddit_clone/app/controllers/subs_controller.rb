class SubsController < ApplicationController

  before_action :require_login

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save!
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages

      redirect_to new_sub_url
    end
  end

  def edit
    @sub = current_user.subs.find(params[:id])
    if @sub.nil?
      flash[:errors] = ["Can\'t edit other user\'s subs"]
      redirect_to subs_url
    end
  end

  def update
     @sub = current_user.subs.find(params[:id])

     if @sub.update(sub_params)
        redirect_to sub_url(@sub.id)
     else
        flash[:errors] = @sub.errors.full_messages
        redirect_to edit_sub_url(@sub.id)
     end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
