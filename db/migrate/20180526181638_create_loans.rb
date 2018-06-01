class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.string :giver
      t.float :sum
      t.integer :term
      t.float :interest
      t.timestamps
    end
  end
end
