class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports, id: :uuid do |t|
      t.references :analysis, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.integer :format
      t.text :content
      t.string :export_url
      t.integer :version

      t.timestamps
    end
  end
end
