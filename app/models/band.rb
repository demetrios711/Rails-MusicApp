class Band < ApplicationRecord
  validates :name, presence: :true

  has_many(
    :albums,
    class_name: :Album,
    foreign_key: :band_id,
    primary_key: :id,
    dependent: :delete_all
  )

  def inspect
    self.name
  end
end
