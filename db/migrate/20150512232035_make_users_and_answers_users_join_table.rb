class MakeUsersAndAnswersUsersJoinTable < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    add_column(:answers, :user_id, :string)

    # create_table(:answers_users, id: false) do |t|
    #   t.belongs_to(:answer, index: true)
    #   t.belongs_to(:user, index: true)
    #end
  end
end
