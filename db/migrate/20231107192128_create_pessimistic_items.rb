class CreatePessimisticItems < ActiveRecord::Migration[7.1]
  def change
    create_table :pessimistic_items do |t|
      t.string :title

      t.timestamps
    end
  end
end
