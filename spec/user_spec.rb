require('spec_helper')

describe(Survey) do
  it("lists users") do
    user_1 = User.create(:name => "Bertha")
    expect(user_1.name()).to(eq("Bertha"))
  end

end
