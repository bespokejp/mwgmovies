class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "#{get_domain}/users/#{user.activation_token}/activate"
    mail(to: user.email, subject: 'ようこそMWG Moviesへ！メールアドレスの認証をお願いします')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "#{get_domain}/login"
    mail(to: user.email, subject: 'メールアドレスの認証が完了しました！')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)
    mail(:to => user.email,
      :subject => "パスワードリセットのご案内")
  end 

  private

  def get_domain
    case ENV["SERVER_STAGE"]
    when 'prod'
      "https://www.mwgmovies.com/"
    when 'stg'
      "https://mwgmovies-stg.herokuapp.com/"
    else
      "http://localhost:5000"
    end
  end
end
