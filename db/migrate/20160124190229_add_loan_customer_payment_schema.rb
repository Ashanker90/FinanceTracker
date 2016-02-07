class AddLoanCustomerPaymentSchema < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.text :phone_number, null: false
      t.timestamps null: false
    end

    create_table :loans do |t|
      t.belongs_to :customer, null: false
      t.decimal :amount, null: false
      t.timestamps null: false
    end

    create_table :payments do |t|
      t.belongs_to :loan, null: false
      t.decimal :amount, null: false
      t.timestamps null: false
    end
  end

end
