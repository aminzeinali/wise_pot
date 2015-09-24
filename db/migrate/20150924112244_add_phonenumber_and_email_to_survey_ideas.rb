class AddPhonenumberAndEmailToSurveyIdeas < ActiveRecord::Migration
  def change
    add_column :survey_ideas, :phone_number, :string
    add_column :survey_ideas, :email, :string
  end
end
