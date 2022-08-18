class PagesController < ApplicationController
  before_action :set_user, except: :home

  require File.expand_path(File.join(File.dirname(__FILE__), '../../discord/helpers/set_timezone'))
  def home; end

  def select_timezone
    @zones = region_zones(params[:region])
  end

  private

  def set_user
    @user = User.find_by(private_id: params[:private_id])
  end
end
