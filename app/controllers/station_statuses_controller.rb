# frozen_string_literal: true

class StationStatusesController < ActionController::API
  def index
    render json: StationStatus.get_statuses_for_station(params[:station_id])
  end
end
