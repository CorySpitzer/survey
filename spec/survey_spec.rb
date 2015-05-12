require('spec_helper')

describe(Survey) do
  it("lists questions for a survey") do
    survey_1 = Survey.create(:description => "yo!")
    question_1 = Question.create({:survey_id => survey_1.id()})
    question_2 = Question.create({:survey_id => survey_1.id()})
    expect(survey_1.questions()).to(eq([question_1, question_2]))
  end

  it("validates presence of survey name") do
    survey_1 = Survey.new(:description => "")
    expect(survey_1.save).to(eq(false))
  end

  it("ensures that the descripton lenght is not too long") do
    survey = Survey.create(:description => 'a'*60)
    expect(survey.save).to eq(false)
  end

end
