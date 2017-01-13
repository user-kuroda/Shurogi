class HowToController < ApplicationController
  def index
    render :index,  layout: false
  end
end
