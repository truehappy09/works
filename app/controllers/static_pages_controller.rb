class StaticPagesController < ApplicationController
  def home
   if signed_in?  
    @micropost = current_user.microposts.build 
    #変更前のコード
   # @feed_items = current_user.feed.paginate(page: params[:page])
     search_word = params[:search].to_s
      @feed_items = current_user.feed.search(search_word).paginate(page: params[:page])
    
  
  end
end

  def help
  end
  def about
  def contact
  end
  
  end
end
