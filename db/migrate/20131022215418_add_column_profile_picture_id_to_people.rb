class AddColumnProfilePictureIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :profile_picture_id, :integer
  end
end
