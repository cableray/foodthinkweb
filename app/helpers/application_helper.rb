module ApplicationHelper
  #unless defined? :current_user then
    def current_user
      User.first
    end
  #end
  
  def user_recipes( user=nil )
    user=current_user if user.nil?
    user.created_recipes
  end
  
  def user_clippings( user=nil )
    user=current_user if user.nil?
    user.clippings
  end
  
end
