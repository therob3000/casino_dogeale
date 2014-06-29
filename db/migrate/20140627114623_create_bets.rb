class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.references :user
      t.string :title
      t.string :content
      t.float :total
      t.float :remainder
      t.string :holder
      t.string :status
      t.timestamp :expiration
      t.timestamps
    end
  end
end
