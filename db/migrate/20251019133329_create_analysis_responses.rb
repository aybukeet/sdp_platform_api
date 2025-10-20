class CreateAnalysisResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :analysis_responses, id: :uuid do |t|
      t.references :analysis, null: false, foreign_key: true, type: :uuid
      t.references :response, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
