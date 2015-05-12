require('spec_helper')

describe(User) do
  it("lists users") do
    user_1 = User.create(:name => "Bertha")
    expect(user_1.name()).to(eq("Bertha"))
  end

  it("will add a answer to a user") do
    user_1 = User.create(:name => "Bartholomew")
    answer_1 = Answer.create({:content => "I hate answering survey questions.", :user_id => user_1.id})
    expect(user_1.answers()).to(eq([answer_1]))
  end

end
