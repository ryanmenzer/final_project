class AddEmailToPeople < ActiveRecord::Migration
  def up
    add_column :people, :email, :string 
  end
  
  def down
    remove_column :people, :email, :string
  end 
end