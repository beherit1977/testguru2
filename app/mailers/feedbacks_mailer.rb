class FeedbacksMailer < ApplicationMailer

  before_action :find_admin

  def new_feedback(feedback)
    @feedback = feedback

    mail  to: @admin.email,
          from: @feedback.user.email,
          subject: "#{I18n.t('mail.feedback.subject')} #{@feedback.user.first_name} #{@feedback.user.last_name}"
  end

  private

  def find_admin
    @admin = User.find_by(email: 'beherit1977@gmail.com')
  end
end