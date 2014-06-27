class CreateDogedlers < ActiveRecord::Migration
  def change
    create_table :dogedlers do |t|
      t.string :unique_holder
    end
  end
end
