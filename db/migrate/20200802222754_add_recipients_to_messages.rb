class AddRecipientsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :recipients, :string, array: true
  end
end
