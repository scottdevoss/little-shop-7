class Invoice < ApplicationRecord
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :customer
  
  enum status: {"cancelled": 0, "in progress": 1, "completed": 2}

  def self.incomplete_by_creation_date
    where(status: 1).order(:created_at)
  end

  def creation_date
    created_at.strftime "%A, %B %-d, %Y"
  end

  def customer_name
    "#{customer.first_name} #{customer.last_name}"
  end

  def revenue
    revenue = 0
    self.invoice_items.each do |item|
      revenue += (item.unit_price * item.quantity)
    end
    revenue
  end

  def self.alphabetical
    order(:id)
  end

  def self.most_recent
    order(created_at: :desc)
  end

  def total_revenue 
    invoice_items.select("SUM(invoice_items.unit_price * invoice_items.quantity) as revenue")[0].revenue
  end

  def total_revenue_less_discounts
    discount_rev = self.invoice_items.reduce(0) do |amount, item|
      amount += (item.quantity * item.unit_price) * (1 - item.discount_rate)
    end
    discount_rev.to_i
  end
    
  def change_status(new_status)
    self.status = new_status
    self.save
  end

  def self.sorted(params)
    if params[:sort] == "alphabetical"
      self.alphabetical
    elsif params[:sort] == "date"
      self.most_recent
    else
      self.all
    end
  end

  def sort_invoice_items(params)
    if params[:sort] == "date"
      @invoice_items = self.invoice_items.most_recent
    else
      @invoice_items = self.invoice_items
    end
  end
end