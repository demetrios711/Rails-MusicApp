class Album < ApplicationRecord
  validates :title, :year, :in_studio, presence:true

  belongs_to(
    :band,
    class_name: :Band,
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: :Track,
    foreign_key: :track_id,
    primary_key: :id
  )

end
