class DataLogsController < ApplicationController
  before_action :authenticate_user! , :except => [:reciever]

  before_action :set_data_log, only: [:show, :edit, :update, :destroy]
  #protect_from_forgery with: :null

  def reciever
    @new_data = DataLog.new

    
    @new_data.humidity_air = params[:hm] 
    @new_data.temperature = params[:tm]
    @new_data.light = params[:l]
    @new_data.humidity_soil = params[:mo]
    @new_data.save
    puts params[:hm]
    render :layout => false     
  end





  # GET /data_logs
  # GET /data_logs.json
  def index
    @data_logs = DataLog.all
  end

  # GET /data_logs/1
  # GET /data_logs/1.json
  def show
  end

  # GET /data_logs/new
  def new
    @data_log = DataLog.new
  end

  # GET /data_logs/1/edit
  def edit
  end

  # POST /data_logs
  # POST /data_logs.json
  def create
    @data_log = DataLog.new(data_log_params)

    respond_to do |format|
      if @data_log.save
        format.html { redirect_to @data_log, notice: 'Data log was successfully created.' }
        format.json { render :show, status: :created, location: @data_log }
      else
        format.html { render :new }
        format.json { render json: @data_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_logs/1
  # PATCH/PUT /data_logs/1.json
  def update
    respond_to do |format|
      if @data_log.update(data_log_params)
        format.html { redirect_to @data_log, notice: 'Data log was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_log }
      else
        format.html { render :edit }
        format.json { render json: @data_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_logs/1
  # DELETE /data_logs/1.json
  def destroy
    @data_log.destroy
    respond_to do |format|
      format.html { redirect_to data_logs_url, notice: 'Data log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_log
      @data_log = DataLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_log_params
      params.require(:data_log).permit(:user_id, :plant_id, :humidity_soil, :humidity_air, :light, :temperature)
    end
end
