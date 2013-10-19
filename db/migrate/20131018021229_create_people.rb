class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :tenant_id
      t.integer :user_id
      t.integer :category_id, null: false
      t.string  :full_name
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.string  :nationality
      t.string  :phone_number
      t.date    :date_of_birth
      t.timestamps
    end

    add_index :people, :tenant_id
    add_index :people, :user_id
    add_index :people, :category_id
    add_index :people, :full_name
    add_index :people, :first_name
    add_index :people, :last_name
    add_index :people, :nationality
    add_index :people, :phone_number
    add_index :people, :date_of_birth
  end
end
