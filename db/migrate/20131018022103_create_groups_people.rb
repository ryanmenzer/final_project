class CreateGroupsPeople < ActiveRecord::Migration
  def change
    create_table :groups_people, id: false do |t|
      t.integer :person_id
      t.integer :group_id, null: false

      t.timestamps
    end
    add_index :groups_people, :person_id
    add_index :groups_people, :group_id
  end
end
