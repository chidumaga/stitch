class AddUserIdToStitches < ActiveRecord::Migration
  def change
    add_column :stitches, :user_id, :integer
  end
end
