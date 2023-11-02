require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it { should have_many(:invoices) }
  end

  describe "#top_five" do
    it "displays the top 5 customers" do
      @merchant1 = Merchant.create!(name: "Hannah's Handbags")
      @merchant2 = Merchant.create!(name: "Jason's Furniture")

      @customer1 = Customer.create!(first_name: "John", last_name: "Jacobs")
      @customer2 = Customer.create!(first_name: "Susan", last_name: "Robinson")
      @customer3 = Customer.create!(first_name: "Jessica", last_name: "Simpson")
      @customer4 = Customer.create!(first_name: "Harry", last_name: "Potter")
      @customer5 = Customer.create!(first_name: "Ron", last_name: "Weasley")
      @customer6 = Customer.create!(first_name: "Nicole", last_name: "Johnson")
      @customer7 = Customer.create!(first_name: "Jackie", last_name: "Chan")
      
      @invoice1 = Invoice.create!(status: 0, customer_id: @customer1.id)
      @invoice2 = Invoice.create!(status: 2, customer_id: @customer2.id)
      @invoice3 = Invoice.create!(status: 2, customer_id: @customer3.id)
      @invoice4 = Invoice.create!(status: 2, customer_id: @customer4.id)
      @invoice5 = Invoice.create!(status: 2, customer_id: @customer5.id)
      @invoice6 = Invoice.create!(status: 2, customer_id: @customer6.id)
      @invoice7 = Invoice.create!(status: 0, customer_id: @customer7.id)
      @invoice8 = Invoice.create!(status: 0, customer_id: @customer7.id)

      @transaction1 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 1, invoice_id: @invoice1.id)
      @transaction2 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice2.id)
      @transaction3 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice3.id)
      @transaction4 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice4.id)
      @transaction5 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice5.id)
      @transaction6 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice6.id)
      @transaction7 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 1, invoice_id: @invoice7.id)


      expect(Customer.top_five).to eq([@customer2, @customer3, @customer4, @customer5, @customer6])
      expect(Customer.top_five).to_not include(@customer1)
      expect(Customer.top_five).to_not include(@customer7)
    end
  end

  describe "full name" do 
    it 'can give a customers full name' do
      customer = Customer.create!(first_name: "John", last_name: "Jacobs")
      expect(customer.full_name).to eq("John Jacobs")
    end
  end
end