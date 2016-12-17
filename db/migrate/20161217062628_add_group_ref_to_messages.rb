class AddGroupRefToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :group, foreign_key: true, null: false
  end
end
