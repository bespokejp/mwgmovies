class InquiryMailer < ApplicationMailer
  def inquiry_email(inquiry)
    @inquiry = inquiry
    mail(to: 'mwgmovies@webinavi.com', subject: '新規お問い合わせがあります')
  end
end