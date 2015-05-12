class CreateInitialTablesAndColumns < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t| # t is a task
      t.column(:description, :string)

      t.timestamps
    end

    create_table(:questions) do |t|
      t.column(:content, :string)
      t.column(:survey_id, :integer)

      t.timestamps
    end

    create_table(:answers) do |t|
      t.column(:content, :string)
      t.column(:question_id, :integer)

      t.timestamps
    end

  end
end
