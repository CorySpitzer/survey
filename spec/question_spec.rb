require('spec_helper')

describe(Question) do
  it("lists survey for a question") do
    survey_1 = Survey.create(:description => 'survey1')
    question_1 = Question.create({:survey_id => survey_1.id()})
    expect(question_1.survey()).to(eq(survey_1))
  end

  it("lists answers for a question") do
    survey_1 = Survey.create(:description => 'survey1')
    question_1 = Question.create({:survey_id => survey_1.id()})
    answer_1 = Answer.create(:question_id => question_1.id())
    answer_2 = Answer.create(:question_id => question_1.id())
    expect(question_1.answers()).to(eq([answer_1, answer_2]))
  end
end
