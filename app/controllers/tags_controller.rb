class TagsController < ApplicationController
  def index
    @tags = []
    Item.where(user: session[:usr]).each do |item|
      item.tag_list.each{ |tag| @tags << tag }
    end
    @tags.uniq!
  end
end
