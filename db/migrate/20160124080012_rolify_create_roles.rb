class RolifyCreateRoles < ActiveRecord::Migration
  def up
    create_table(:roles) do |t|
      t.string :name
      t.string :resource_type
      t.timestamps
    end

    add_index(:roles, :name)
  end

  def down
    drop_table :roles
  end

end
