class FeedbacksController < ApplicationController

   def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.new_feedback(@feedback).deliver_now
      redirect_to root_path, notice: t('mail.feedback.sended')
    else
      flash[:alert] = t('mail.feedback.error')
      render :new
    end
  end

private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
