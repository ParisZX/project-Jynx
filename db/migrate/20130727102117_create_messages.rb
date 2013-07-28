class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :messages, [:user_id, :created_at]
  end
end
