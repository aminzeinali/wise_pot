class CreateSurveyIdeas < ActiveRecord::Migration
  def change
    create_table :survey_ideas do |t|
      t.string :gender
      t.integer :age
      t.integer :idea1
      t.integer :idea2
      t.integer :idea3
      t.integer :idea4
      t.integer :idea5

      t.timestamps null: false
    end
  end
end
