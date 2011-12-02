class RecipeDecorator < ApplicationDecorator
  decorates :recipe
  
  
  def seconds_to_dhms(seconds)
    minutes, seconds = seconds.divmod 60
    hours, minutes = minutes.divmod 60
    days, hours = hours.divmod 24
    [days, hours, minutes, seconds]
  end
  
  def format_dhms(days, hours, minutes, seconds)
    parts=[]
    parts.push(h.pluralize days, "day") if days > 0
    parts.push(h.pluralize hours, "hour") if hours > 0
    parts.push(h.pluralize minutes, "minute") if minutes > 0
    parts.push(h.pluralize seconds, "seconds") if seconds > 0
    parts.join ", "
  end
  
  def format_seconds(seconds)
    format_dhms *seconds_to_dhms(seconds)
  end
  
  def cook_time_dhms
    format_seconds model.cook_time
  end
  
  def prep_time_dhms
    format_seconds model.prep_time
  end
  
  def total_time_dhms
    format_seconds model.total_time
  end
  
  def clipped?
    h.current_user and model.clipped_by?(h.current_user)
  end
  
  #def description
  #  h.mkd model.description
  #end
  
  #def steps
  #  h.mkd model.steps
  #end

  # Accessing Helpers
  #   You can access any helper via a proxy
  #
  #   Normal Usage: helpers.number_to_currency(2)
  #   Abbreviated : h.number_to_currency(2)
  #   
  #   Or, optionally enable "lazy helpers" by calling this method:
  #     lazy_helpers
  #   Then use the helpers with no proxy:
  #     number_to_currency(2)

  # Defining an Interface
  #   Control access to the wrapped subject's methods using one of the following:
  #
  #   To allow only the listed methods (whitelist):
  #     allows :method1, :method2
  #
  #   To allow everything except the listed methods (blacklist):
  #     denies :method1, :method2

  # Presentation Methods
  #   Define your own instance methods, even overriding accessors
  #   generated by ActiveRecord:
  #   
  #   def created_at
  #     h.content_tag :span, time.strftime("%a %m/%d/%y"), 
  #                   :class => 'timestamp'
  #   end
end