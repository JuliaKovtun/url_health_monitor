class UrlMonitorController < ApplicationController
  before_action :set_url_monitor, only: %i[show update destroy]


  def index
    render json: UrlMonitor.includes(:checks)
  end

  def create
    url_monitor = UrlMonitor.new(url_monitor_params)
    if url_monitor.save
      render json: url_monitor, status: :created
    else
      render json: url_monitor.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @url_monitor
  end

  def update
    if @url_monitor.update(url_monitor_params)
      render json: @url_monitor
    else
      render json: @url_monitor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @url_monitor.destroy
    render json: :no_content
  end

  private

  def set_url_monitor
    @url_monitor = UrlMonitor.find(params[:id])
  end

  def url_monitor_params
    params.require(:url_monitor).premit(:url, :name, :check_interval)
  end
end
