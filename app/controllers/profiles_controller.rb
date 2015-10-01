class ProfilesController < ApplicationController

  before_action :authenticate_user! 

  before_action :set_profile, only: [:show, :edit, :update, :destroy,:my_gardens, :about_me,:my_posts, :my_flowers]

  def my_devices
    @tempeople = Profile.all.where.not(user_id: current_user.id).first(3)

    respond_to do |format|
      format.js
    end

  end

  def my_gardens
    @planters = @profile.user.following_by_type('Planter')
    respond_to do |format|
      format.js
    end
  end

  def my_accounts
    @comments = current_user.comments
    respond_to do |format|
      format.js
    end

  end

  def about_me
    respond_to do |format|
      format.js
    end
  end

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @garden = Garden.new
    @plant = Plant.new

    @plants_count = 0

    current_user.profile.gardens.each do |g|
      @plants_count += g.plants.count
    end

  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    
    @profile.user_id = current_user.id
    @profile.full_name = @profile.first_name + @profile.last_name

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, :notice => t('alerts.profiles.create') }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
   if params[:profile][:remove_profile_photo] == "1" 
    @profile.remove_profile_photo = nil
    @profile.save
   end
   if params[:profile][:remove_cover_photo] == "1"
    @profile.remove_cover_photo = nil
    @profile.save
   end
    
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, :notice => t('alerts.profiles.update') }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, :notice => t('alerts.profiles.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find_by_full_name(params[:id])
      if @profile.gender == 0
      @page_title = "آقای"
      else
        @page_title = "خانم"
      end
      if @profile.present?
        @page_title = @page_title + " " + @profile.first_name + " " + @profile.last_name
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :profile_photo, :cover_photo ,
       :first_name , :last_name , :gender , :remove_cover_photo , :remove_profile_photo,:full_name, :mobile_number)
    end
end