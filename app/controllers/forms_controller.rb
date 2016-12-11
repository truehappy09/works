class FormsController < ApplicationController
def find
    @content = @content.params[:content]
end

def index
  @microposts = Micropost.all
end
end
