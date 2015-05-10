class PlantersController < ApplicationController
  before_action :set_planter, only: [:show, :edit, :update, :destroy]

  # GET /planters
  # GET /planters.json
  def index
    @planters = Planter.all
  end

  # GET /planters/1
  # GET /planters/1.json
  def show
    @comment = Comment.new
  end

  # GET /planters/new
  def new
    @planter = Planter.new
  end

  # GET /planters/1/edit
  def edit
  end

  # POST /planters
  # POST /planters.json
  def create
    @planter = Planter.new(planter_params)

    respond_to do |format|
      if @planter.save
        format.html { redirect_to @planter, notice: 'Planter was successfully created.' }
        format.json { render :show, status: :created, location: @planter }
      else
        format.html { render :new }
        format.json { render json: @planter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planters/1
  # PATCH/PUT /planters/1.json
  def update
    respond_to do |format|
      if @planter.update(planter_params)
        format.html { redirect_to @planter, notice: 'Planter was successfully updated.' }
        format.json { render :show, status: :ok, location: @planter }
      else
        format.html { render :edit }
        format.json { render json: @planter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planters/1
  # DELETE /planters/1.json
  def destroy
    @planter.destroy
    respond_to do |format|
      format.html { redirect_to planters_url, notice: 'Planter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planter
      @planter = Planter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planter_params
      params.require(:planter).permit(:brief_desc ,:plant_id , :humidity_soil, :humidity_air ,  
        :temperature, :light_degree , :name, :image_1, :image_2, :image_3,
        :image_4, :additional_image )
    end
end
