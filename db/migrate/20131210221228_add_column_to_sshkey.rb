class AddColumnToSshkey < ActiveRecord::Migration
  def change
    add_column :sshkeys, :keytype, :string
  end
end
