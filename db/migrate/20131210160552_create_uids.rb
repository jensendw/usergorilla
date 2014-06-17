class CreateUids < ActiveRecord::Migration
  def change
    create_table :uids do |t|
      t.integer :user_id
      t.integer :uid

      t.timestamps
    end
  end
end
