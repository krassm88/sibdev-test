class AddEndAtToAdvert < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :end_at, :datetime, null: false
  end
end
