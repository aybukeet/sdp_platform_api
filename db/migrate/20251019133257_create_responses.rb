class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses, id: :uuid do |t|
      t.references :survey, null: false, foreign_key: true, type: :uuid
      t.string :participant_id
      t.jsonb :response_data
      t.jsonb :demographic_data
      t.integer :completion_status
      t.datetime :started_at
      t.datetime :completed_at
      t.string :ip_address
      t.string :device_info

      t.timestamps
    end
  end
end
