class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.integer :tenant_id
      t.integer :manager_id
      t.integer :initiative_type_id, null: false
      t.string  :title,              null: false
      t.text    :description
      t.float   :goal
      t.boolean :active,             default: true
      t.date    :start_date
      t.date    :end_date

      t.timestamps
    end
    add_index :initiatives, :tenant_id
    add_index :initiatives, :manager_id
    add_index :initiatives, :initiative_type_id
    add_index :initiatives, :title
    add_index :initiatives, :start_date
    add_index :initiatives, :end_date
  end
end
