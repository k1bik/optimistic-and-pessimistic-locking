class CreateOptimisticItems < ActiveRecord::Migration[7.1]
  def change
    create_table :optimistic_items do |t|
      t.string :title
      t.integer :lock_version

      t.timestamps
    end
  end
end
