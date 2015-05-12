class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:description, {:presence => true, :length => {maximum: 55}})
  before_save(:capitalize_me)

private

  def capitalize_me
    pieces = self.description.split(" ")
    pieces.each do |piece|
      piece.capitalize!
    end
    self.description = pieces.join(" ")
  end

end
