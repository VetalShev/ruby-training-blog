class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :user_one_id
      t.integer :user_two_id
      t.integer :status
      t.integer :action_user_id

      t.timestamps
    end
  end
end

