class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.string :name, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
