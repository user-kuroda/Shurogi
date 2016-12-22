class TopController < ApplicationController
  skip_before_action :check_logined
  def index
  	render layout: false 
  end
end
