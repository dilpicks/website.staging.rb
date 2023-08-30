class AddPrimaryToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :primary, :boolean, null: false, default: false
    add_index :images, [:primary, :imageable_id, :imageable_type],
                    unique: true,
                    where: "(images.primary = TRUE)"
  end
end
