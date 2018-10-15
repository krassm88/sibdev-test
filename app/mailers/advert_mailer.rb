class AdvertMailer < ApplicationMailer
  def advert_end_at(advert)
    @advert = advert
    mail(to: @advert.user.email, subject: "Ваше обьявление будет закрыто")
  end
end
