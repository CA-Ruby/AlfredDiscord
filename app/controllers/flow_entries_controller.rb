class FlowEntriesController < ApplicationController
  def show
    @user = User.find_by(private_id: params[:id])
    @flow_entries = FlowEntry.where(user: @user).order(created_at: :desc)
    @flow_entries_by_day = FlowEntry.where(user: @user).order(created_at: :desc).group_by { |t| t.created_at.to_date }
  end

  def detail
    @flow_entries_day = FlowEntry.find(params[:flow_entries_day])
  end
end
