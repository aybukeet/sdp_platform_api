class CreateSurveyScales < ActiveRecord::Migration[8.0]
  def change
    create_table :survey_scales, id: :uuid do |t|
      t.references :survey, null: false, foreign_key: true, type: :uuid
      t.references :scale, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
