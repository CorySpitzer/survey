require('spec_helper')

describe(Answer) do
  it("lists a question for an answer") do
    survey_1 = Survey.create(:description => 'description1')
    question_1 = Question.create(survey_id: survey_1.id())
    answer_1 = Answer.create(question_id: question_1.id())
    expect(answer_1.question().id).to(eq(question_1.id))
  end
end
