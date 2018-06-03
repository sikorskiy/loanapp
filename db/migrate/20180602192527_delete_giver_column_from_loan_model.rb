class DeleteGiverColumnFromLoanModel < ActiveRecord::Migration[5.1]
  def change
    remove_column :loans, :giver
  end
end
