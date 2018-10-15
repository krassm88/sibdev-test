class Advert < ApplicationRecord
  scope :not_ended, -> { where("end_at > ?", DateTime.now) }

  belongs_to :user

  validates :title, :body, presence: true

  before_save do
    self.end_at = DateTime.now + 2.weeks
  end
end
