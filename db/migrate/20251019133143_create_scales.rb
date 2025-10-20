class CreateScales < ActiveRecord::Migration[8.0]
  def change
    create_table :scales, id: :uuid do |t|
      t.string :unique_identifier
      t.string :title
      t.text :description
      t.string :version
      t.string :language
      t.string :author
      t.integer :publication_year
      t.integer :citation_count
      t.integer :usage_count
      t.string :category
      t.jsonb :metadata
      t.integer :status
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
