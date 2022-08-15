class PagesController < ApplicationController
  require File.expand_path(File.join(File.dirname(__FILE__), '../../discord/helpers/set_timezone'))
  def home; end

  def select_region
    @timezones = timezones
    @regions = world_regions
  end

  def select_timezone
    @zones = region_zones(params[:region])
  end
end
