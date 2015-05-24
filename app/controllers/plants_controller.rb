class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  # GET /plants
  # GET /plants.json
  def index
    @plants = Plant.all
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
    @comment = Comment.new
    @plant.humidity_soil = DataLog.last.humidity_soil
    @plant.humidity_air = 8#DataLog.last.humidity_air
    @plant.temperature = 27 #DataLog.last.temperature
    @plant.light_degree = DataLog.last.light

    @plant.save
  end

  # GET /plants/new
  def new

    @garden = Garden.find(params[:garden_id]) if params[:garden_id].present?

    @plant = Plant.new

  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = Plant.new(plant_params)
    @plant.name = Planter.find(params[:planter_id]).name
    @plant.humidity_soil = DataLog.last.humidity_soil
    @plant.humidity_air = DataLog.last.humidity_air
    @plant.temperature = DataLog.last.temperature
    @plant.light_degree = DataLog.last.light
    @plant.save
    plant_garden = PlantOnGarden.new
    plant_garden.garden_id = params[:garden_id]
    plant_garden.plant_id = @plant.id
    respond_to do |format|
      if plant_garden.save
        format.html { redirect_to profile_path(current_user.profile), notice: 'Plant was successfully created.' }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1
  # PATCH/PUT /plants/1.json
  def update
    @plant.name = Planter.find(params[:planter_id]).name
  if params[:plant][:remove_image] == "1"
    @plant.image = nil
    @plant.save
  end
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plant_params
      params.require(:plant).permit(:name, :race, :age, :height, :temperature, :humidity_soil, :humidity_air, :light_degree, :health_factor, 
        :remove_image, :description, :image)
    end
end
