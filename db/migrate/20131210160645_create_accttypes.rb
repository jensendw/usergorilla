class CreateAccttypes < ActiveRecord::Migration
  def change
    create_table :accttypes do |t|
      t.integer :user_id
      t.string :accttype

      t.timestamps
    end
  end
end
