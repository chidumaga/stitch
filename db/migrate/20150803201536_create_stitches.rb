class CreateStitches < ActiveRecord::Migration
  def change
    create_table :stitches do |t|

      t.timestamps null: false
    end
  end
end
