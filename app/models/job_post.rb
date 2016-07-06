class JobPost < ActiveRecord::Base
  belongs_to :employer

  validates :title, presence: true
  validates :summary, presence: true
  validates :description, presence: true
  validates :compensation, presence: true
  validates :apply, presence: true

end
