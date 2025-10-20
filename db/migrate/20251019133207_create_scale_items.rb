class CreateScaleItems < ActiveRecord::Migration[8.0]
  def change
    create_table :scale_items, id: :uuid do |t|
      t.references :scale, null: false, foreign_key: true, type: :uuid
      t.integer :item_number
      t.text :item_text
      t.string :item_type
      t.jsonb :scoring_rules

      t.timestamps
    end
  end
end
