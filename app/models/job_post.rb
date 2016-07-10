class JobPost < ActiveRecord::Base
  belongs_to :employer
  belongs_to :job_category

  has_one :payment

  validates :title, presence: true
  validates :summary, presence: true
  validates :description, presence: true
  validates :compensation, presence: true
  validates :apply, presence: true

  scope :unpaid, -> {
    joins("LEFT JOIN payments ON job_posts.id = payments.job_post_id").
    group("job_posts.id").
    having("COUNT(payments.id) = 0").
    last
  }

  def employer_name
    employer && employer.name
  end

end
