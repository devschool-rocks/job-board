class PaymentsController < ApplicationController
  before_action :authenticate_employer!

  def new
    @job_post = current_employer.job_posts.unpaid
    @payment = @job_post.build_payment
  end

  def create
    @job_post = current_employer.job_posts.unpaid
    @payment = @job_post.build_payment
    if @payment.capture(params["stripeToken"])
      redirect_to :root
    else
      render :new
    end
  end

private

end

