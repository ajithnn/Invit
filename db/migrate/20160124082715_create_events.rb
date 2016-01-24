class CreateEvents < ActiveRecord::Migration
  
  def up
    create_table :events do |t|
      t.string :name, :null => false
      t.string :location_name 
      t.string :location_marker
      t.string :event_img
      t.datetime :event_date, :null => false
      t.text :event_message
      t.timestamps null: false
    end
  end

  def down
    drop_table :events
  end

end
