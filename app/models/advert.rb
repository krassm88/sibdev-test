class Advert < ApplicationRecord
  scope :not_ended, -> { where("end_at > ?", DateTime.now) }

  belongs_to :user

  validates :title, :body, presence: true

  before_create do
    self.end_at = DateTime.now + 2.weeks
  end

  after_create do
    SendAdvertEndAtNotificationJob.set(wait: ((self.end_at - 2.days) - DateTime.now).to_f).perform_later(self)
  end
end
