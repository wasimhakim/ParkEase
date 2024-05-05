# frozen_string_literal: true

class Role < ApplicationRecord
  # 
  # constants
  # 
  CUSTOMER_ROLE = 'Customer'
  ADMIN_ROLE = 'Admin'

  #
  # Associations
  #
  has_many :users
end