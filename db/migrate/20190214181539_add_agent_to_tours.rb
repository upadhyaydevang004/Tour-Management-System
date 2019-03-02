class AddAgentToTours < ActiveRecord::Migration[5.2]
  def change
    add_reference :tours, :agent, foreign_key: true
    remove_column :tours, :contact_agent
  end
end
