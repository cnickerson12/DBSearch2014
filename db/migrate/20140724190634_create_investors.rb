class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :fund
      t.decimal :fund_size
      t.integer :fund_id
      t.string :contact
      t.string :email
      t.integer :type

      t.timestamps
    end
  end
end
