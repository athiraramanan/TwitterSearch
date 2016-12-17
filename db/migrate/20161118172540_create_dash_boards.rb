class CreateDashBoards < ActiveRecord::Migration
  def change
    create_table :dash_boards do |t|

      t.timestamps null: false
    end
  end
end
