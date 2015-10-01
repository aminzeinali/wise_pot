class SurveyIdeasController < ApplicationController
  before_action :set_survey_idea, only: [:show, :edit, :update, :destroy]

  # GET /survey_ideas
  # GET /survey_ideas.json
  def index
    @survey_ideas = SurveyIdea.all
  end

  # GET /survey_ideas/1
  # GET /survey_ideas/1.json
  def show
  end

  # GET /survey_ideas/new
  def new
    @survey_idea = SurveyIdea.new
  end

  # GET /survey_ideas/1/edit
  def edit
  end

  # POST /survey_ideas
  # POST /survey_ideas.json
  def create
    @survey_idea = SurveyIdea.new(survey_idea_params)

    respond_to do |format|
      if @survey_idea.save
        format.html { redirect_to new_survey_idea_path(), :notice => t('alerts.survey_ideas.create') }
        format.json { render :show, status: :created, location: @survey_idea }
      else
        format.html { render :new }
        format.json { render json: @survey_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_ideas/1
  # PATCH/PUT /survey_ideas/1.json
  def update
    respond_to do |format|
      if @survey_idea.update(survey_idea_params)
        format.html { redirect_to @survey_idea, notice: 'Survey idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_idea }
      else
        format.html { render :edit }
        format.json { render json: @survey_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_ideas/1
  # DELETE /survey_ideas/1.json
  def destroy
    @survey_idea.destroy
    respond_to do |format|
      format.html { redirect_to survey_ideas_url, notice: 'Survey idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_idea
      @survey_idea = SurveyIdea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_idea_params
      params.require(:survey_idea).permit(:phonenumber, :email , :gender, :age, :idea1, :idea2, :idea3, :idea4, :idea5)
    end
end
