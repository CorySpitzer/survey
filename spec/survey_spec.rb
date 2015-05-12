require('spec_helper')

describe(Survey) do
  it("lists questions for a survey") do
    survey_1 = Survey.create()
    question_1 = Question.create({:survey_id => survey_1.id()})
    question_2 = Question.create({:survey_id => survey_1.id()})
    expect(survey_1.questions()).to(eq([question_1, question_2]))
  end
end
