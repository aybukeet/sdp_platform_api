class CreateAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :analyses, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.integer :analysis_type
      t.jsonb :parameters
      t.integer :status
      t.integer :credit_cost
      t.jsonb :results
      t.text :error_messages
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
