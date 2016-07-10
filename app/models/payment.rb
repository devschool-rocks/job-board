class Payment < ActiveRecord::Base
  belongs_to :job_post

  before_save :save_amount

  def amount_in_cents
    total * 100
  end

  def total
    (featured? ? featured_cost : 0) + base_cost
  end

  def featured?
    job_post && job_post.featured?
  end

  def featured_cost
    50
  end

  def base_cost
    200
  end

  def capture(token)
    begin
      customer = Stripe::Customer.create email: job_post.employer.email,
                                         card: token
      charge = Stripe::Charge.create customer: customer.id,
                                     amount: amount_in_cents,
                                     description: "Diversity Job Posting",
                                     currency: 'usd'
      update_attributes(auth_code: charge.id)
    rescue
      false
    end
  end

private

  def save_amount
    write_attribute(:amount, total)
  end
end
