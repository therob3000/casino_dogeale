class CreateAcceptedBets < ActiveRecord::Migration
  def change
    create_table :accepted_bets do |t|
      t.references :bet
      t.references :user
      t.float :amount
      t.string :holder
      t.string :status
      t.timestamps
    end
  end
end
