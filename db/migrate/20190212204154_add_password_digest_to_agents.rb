class AddPasswordDigestToAgents < ActiveRecord::Migration[5.2]
  def up
    add_column :agents, :password_digest, :string
    add_column :admins, :password_digest, :string
    add_column :customers, :password_digest, :string
  end
  def down
    remove_column :agents, :password_digest
    remove_column :admins, :password_digest
    remove_column :agents, :password_digest
  end
end
