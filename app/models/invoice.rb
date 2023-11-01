class Invoice < ApplicationRecord
  belongs_to :merchant
  enum status: {"cancelled": 0, "in progress": 1, "completed": 2}
end