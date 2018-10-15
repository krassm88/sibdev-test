class SendAdvertEndAtNotificationJob < ApplicationJob
  queue_as :default

  def perform(advert)
    AdvertMailer.advert_end_at(advert).deliver_now
  end
end
