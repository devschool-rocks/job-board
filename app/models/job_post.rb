class JobPost < ActiveRecord::Base
  belongs_to :employer
  belongs_to :job_category

  validates :title, presence: true
  validates :summary, presence: true
  validates :description, presence: true
  validates :compensation, presence: true
  validates :apply, presence: true

  def employer_name
    employer && employer.name
  end

end
