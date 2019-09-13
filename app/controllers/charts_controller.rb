class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :edit, :update, :destroy]
  def index
    @charts = current_user.charts
  end

  def show
  end

  def new
    @chart = current_user.charts.new
  end

  def create
    @chart = current_user.charts.new(chart_params)
    if @chart.save
      flash[:success] = "Chart created"
      redirect_to charts_path
    else
      # binding.pry
      flash[:error] = "Error: Chart was not created"
      # the message you are getting the array from a hash (think Ruby)
      render :new
    end
  end

  def edit
  end

  def update
    if @chart.update(chart_params)
      redirect_to charts_path
    else
      render :edit
    end
  end

  def destroy
    @chart.destroy
    redirect_to charts_path
  end

  private
    def set_chart
      @chart = current_user.charts.find(params[:id])
    end

    def chart_params
      params.require(:chart).permit(:chart_name)
    end

end
