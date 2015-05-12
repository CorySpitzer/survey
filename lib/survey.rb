class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:description, {:presence => true, :length => {maximum: 55}})
end
