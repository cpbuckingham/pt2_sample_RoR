class CreateCoders < ActiveRecord::Migration
  def change
    create_table :coders do |t|
      t.string :name
      t.string :email
      t.string :github_username

      t.timestamps null: false
    end
  end
end
