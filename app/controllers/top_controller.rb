class TopController < ApplicationController
  skip_before_action :check_logined
  def index
  end
end
