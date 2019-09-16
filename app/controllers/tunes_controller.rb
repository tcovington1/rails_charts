class TunesController < ApplicationController
  before_action :set_tune, only: [:show, :edit, :update, :destroy]
  before_action :set_chart
  
  def index
    @tunes = @chart.tunes
  end

  def show
  end

  def new
    @tune = Tune.new
  end

  def create
    @tune = @chart.tunes.new(tune_params)
    if @tune.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tune.update(tune_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @tune.destroy
    redirect_to root_path
  end

  private
  def set_tune
    @tune = Tune.find(params[:id])
  end

  def set_chart
    @chart = Chart.find(params[:chart_id])
  end
  
  def tune_params
    params.require(:tune).permit(:name, :artist, :genre)
  end

end
