class FlowEntriesController < ApplicationController
  def show
    @user = User.find_by(private_id: params[:id])
    p "1: #{@user}"
    @flow_entries = FlowEntry.where(user: @user).order(created_at: :desc)
    p "2: #{@flow_entries}"
    @flow_entries_by_day = FlowEntry.where(user: @user).order(created_at: :desc).group_by { |t| t.created_at.to_date }
  end
end
