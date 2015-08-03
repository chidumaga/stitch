class AddNameToStitches < ActiveRecord::Migration
  def change
    add_column :stitches, :name, :text
  end
end
