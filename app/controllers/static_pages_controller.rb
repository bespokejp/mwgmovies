class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def welcome
    render layout: 'welcome'
  end
end
