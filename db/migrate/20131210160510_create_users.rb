class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :ingroups
      t.string :shell
      t.string :password
      t.string :realname
      t.string :ensure
      t.string :ldapowner

      t.timestamps
    end
  end
end
