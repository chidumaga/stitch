class AddIsContributionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :is_contribution, :boolean, null: false, default: false
  end
end
