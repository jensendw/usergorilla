class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.integer :user_id
      t.string :environment

      t.timestamps
    end
  end
end
