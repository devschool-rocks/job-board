class AddJobCategoryToJobPost < ActiveRecord::Migration
  def change
    add_reference :job_posts, :job_category, index: true, foreign_key: true
  end
end
