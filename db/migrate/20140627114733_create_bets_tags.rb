class CreateBetsTags < ActiveRecord::Migration
  def change
    create_table :bets_tags do |t|
      t.references :tag
      t.references :bet
    end
  end
end


