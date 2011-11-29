module ApplicationHelper
  
  def user_recipes( user=nil )
    user=current_user if user.nil?
    user.created_recipes
  end
  
  def user_clippings( user=nil )
    user=current_user if user.nil?
    user.clippings
  end
  
  def mkd( text )
    BlueCloth.new(text).to_html
  end
  
end
