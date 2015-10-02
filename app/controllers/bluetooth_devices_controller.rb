class BluetoothDevicesController < ApplicationController
  before_action :set_bluetooth_device, only: [:show, :edit, :update, :destroy]

  # GET /bluetooth_devices
  # GET /bluetooth_devices.json
  def index
    @bluetooth_devices = BluetoothDevice.all
  end

  # GET /bluetooth_devices/1
  # GET /bluetooth_devices/1.json
  def show
  end

  # GET /bluetooth_devices/new
  def new
    @bluetooth_device = BluetoothDevice.new
  end

  # GET /bluetooth_devices/1/edit
  def edit
  end

  # POST /bluetooth_devices
  # POST /bluetooth_devices.json
  def create
    @bluetooth_device = BluetoothDevice.new(bluetooth_device_params)

    respond_to do |format|
      if @bluetooth_device.save
        format.html { redirect_to @bluetooth_device, :notice => t("alerts.bluetooth_device.create") }
        format.json { render :show, status: :created, location: @bluetooth_device }
      else
        format.html { render :new }
        format.json { render json: @bluetooth_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bluetooth_devices/1
  # PATCH/PUT /bluetooth_devices/1.json
  def update
    respond_to do |format|
      if @bluetooth_device.update(bluetooth_device_params)
        format.html { redirect_to @bluetooth_device, :notice => t("alerts.bluetooth_device.update") }
        format.json { render :show, status: :ok, location: @bluetooth_device }
      else
        format.html { render :edit }
        format.json { render json: @bluetooth_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bluetooth_devices/1
  # DELETE /bluetooth_devices/1.json
  def destroy
    @bluetooth_device.destroy
    respond_to do |format|
      format.html { redirect_to bluetooth_devices_url, :notice => t("alerts.bluetooth_device.destroy") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bluetooth_device
      @bluetooth_device = BluetoothDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bluetooth_device_params
      params.require(:bluetooth_device).permit(:user_id, :sampling_times, :location, :version, :status)
    end
end
