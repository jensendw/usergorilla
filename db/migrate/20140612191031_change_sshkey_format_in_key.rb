class ChangeSshkeyFormatInKey < ActiveRecord::Migration
  def self.up
    change_column :sshkeys, :key, :text, :limit => 1000
  end

  def self.down
    change_column :sshkeys, :key, :text
  end
end
