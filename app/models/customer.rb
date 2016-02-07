class Customer < ActiveRecord::Base
	has_many :loans, dependent: :destroy
end
