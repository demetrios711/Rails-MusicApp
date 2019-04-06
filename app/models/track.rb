class Track < ApplicationRecord
  validates :title, :ord, presence:true

  belongs_to(
    :album,
    class_name: :Album,
    foreign_key: :album_id,
    primary_key: :id
  )

  belongs_to :band, through: :album, source: :band
end
