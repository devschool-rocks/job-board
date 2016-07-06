class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.references :employer, index: true, foreign_key: true
      t.string :title, null: false, default: ""
      t.text :summary, null: false, default: ""
      t.text :description, null: false, default: ""
      t.text :compensation, null: false, default: ""
      t.text :apply, null: false, default: ""
      t.datetime :cancelled_at
      t.date :expires_on
      t.date :filled_on

      t.timestamps null: false
    end
  end
end
