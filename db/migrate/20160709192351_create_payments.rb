class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :job_post, index: true, foreign_key: true
      t.string :auth_code
      t.string :token
      t.string :amount

      t.timestamps null: false
    end
  end
end
