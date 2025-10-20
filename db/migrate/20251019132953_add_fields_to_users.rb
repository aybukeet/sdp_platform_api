class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer, default: 0, null: false
    add_column :users, :credit_balance, :integer, default: 0, null: false
    add_column :users, :organization, :string
    add_column :users, :locale, :string, default: 'en'
    
    add_index :users, :role
  end
end