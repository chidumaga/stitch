class AddIsContributionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :is_contribution, :boolean
  end
end
