class JobPostsController < ApplicationController
  before_action :authenticate_employer!, except: %i[index show]

  # GET /job_posts
  def index
    @job_posts = JobPost.all
  end

  def show
    job_post
  end

  def new
    new_job_post
  end

  def create
    if new_job_post(job_post_params).save
      redirect_to job_posts_path
    else
      render :new
    end
  end

private

  def job_post
    @job_post ||= JobPost.find(params[:id])
  end

  def new_job_post(attrs={})
    @job_post ||= current_employer.job_posts.new(attrs)
  end

  def job_post_params
    params.require(:job_post).permit(:title, :job_category_id, :summary,
                                     :description, :compensation,
                                     :apply)
  end

end
