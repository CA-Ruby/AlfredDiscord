class FlowEntriesController < ApplicationController
  def index
    @user = User.first
    @flow_entries = FlowEntry.where(user: @user).order(created_at: :desc)
    @flow_entries_by_day = FlowEntry.where(user: @user).order(created_at: :desc).group_by { |t| t.created_at.to_date }
  end
end