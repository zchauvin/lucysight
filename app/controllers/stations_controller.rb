# frozen_string_literal: true

class StationsController < ActionController::API
  def index
    render json: Station.search(params[:name])
  end

  def show
    render json: Station.find(params[:id])
  end
end
