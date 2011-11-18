class RestJsonDecorator < ApplicationDecorator
  class << self
    include Rails.application.routes.url_helpers
    def default_url_options; {:host => 'www.example.com'}; end;
  end

    
  @@links={}
  
  def self.link( relation, url=nil, &block )
    @@links[relation]=url unless url.nil?
    @@links[relation]=block unless block.nil?
    @@links[:self]=lambda {|m| polymorphic_url(m)} if relation==:self and url.nil? and block.nil?
  end
  
  def initialize(input, context = {})
    super(input, context)
    links :force_eval=>true
  end
  
  def links (options={})
    return @links unless @links.nil? || options[:force_eval]
    @links=[]
    @@links.each_pair do |key, value|
      if value.kind_of? Proc then
        @links.push format_link( key, value.call(@model))
      else
        @links.push format_link key, value
      end
    end
    @links
  end
  
  def format_link(relation, href)
    {
      :rel=>relation,
      :href=>href,
    }
  end
  
end