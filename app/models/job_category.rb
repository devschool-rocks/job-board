class JobCategory < ActiveRecord::Base
  has_many :job_posts

  scope :with_jobs, -> {
    joins("INNER JOIN job_posts ON job_posts.job_category_id = job_categories.id").
    group("job_categories.id")
  }
end
