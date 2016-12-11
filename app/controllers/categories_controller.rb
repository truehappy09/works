class CategoriesController < ApplicationController
 
 def new
  @category = Category.new
 end
 
 def form
 end
 
 def create
  @category = Category.new(category_params)
  @category.save
  redirect_to root_path
    
 
 end

 
 private 
 
 def category_params
  params.require(:category).permit(:name)
 end
 
  # if @category.save
   # DBへの保存ができたら○◯のページにリダイレクト
  # else
   # DBへの保存に失敗したら○◯のページにリダイレクト
  # end
end
