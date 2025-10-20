class CreateSurveys < ActiveRecord::Migration[8.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.text :description
      t.integer :distribution_mode
      t.integer :status
      t.datetime :start_date
      t.datetime :end_date
      t.integer :target_participants
      t.integer :actual_participants
      t.decimal :completion_rate
      t.jsonb :settings

      t.timestamps
    end
  end
end
