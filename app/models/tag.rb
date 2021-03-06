class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :videos, through: :taggings

	belongs_to :user

  scope :top, ->(num_results = 5) {
    select("tags.id, tags.name, tags.user_id, count(taggings.id) AS taggings_count").
    joins(:taggings).
    group("tags.id").
    order("taggings_count DESC").
    limit(num_results)
  }

end
