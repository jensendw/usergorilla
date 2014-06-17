class CreateOausers < ActiveRecord::Migration
  def change
    create_table :oausers do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
