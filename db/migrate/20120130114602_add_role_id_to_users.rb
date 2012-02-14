class AddRoleIdToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.references :role
    end
  end

  def self.down
  end
end
