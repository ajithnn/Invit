class CreateUserEvents < ActiveRecord::Migration
  def up
    create_table :user_events do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.references :role
      t.text :event_user_message
      t.timestamps null: false
    end
  end

  def down
    drop_table :user_events
  end
end
