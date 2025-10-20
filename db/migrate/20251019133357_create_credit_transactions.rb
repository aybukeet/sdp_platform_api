class CreateCreditTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :credit_transactions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.integer :amount
      t.integer :transaction_type
      t.string :reference_type
      t.uuid :reference_id

      t.timestamps
    end
  end
end
