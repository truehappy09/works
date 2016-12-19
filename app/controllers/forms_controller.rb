class FormsController < ApplicationController
  def find
    @microposts = Micropost.where('content like?', "%" + params[:search_content] + "%")
  end

  def index
    @microposts = Micropost.all
  end

  def select
    @microposts = Micropost.where(genre: params[:genre][:select_category])
  end
end
