json.array!(@survey_ideas) do |survey_idea|
  json.extract! survey_idea, :id, :gender, :age, :idea1, :idea2, :idea3, :idea4, :idea5
  json.url survey_idea_url(survey_idea, format: :json)
end
