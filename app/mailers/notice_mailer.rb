class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_topic.subject
  #
  def sendmail_topic(topic,user)
    @topic = topic
    @user = user

    mail to: @user.email,
      subject: 'トピックが投稿されました'
  end
end
