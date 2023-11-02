require "rails_helper"

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    it { should have_many(:transactions) }
    it { should have_many(:invoice_items) }
    it {should belong_to(:customer) }
  end

  describe "methods" do
    before :each do
      @customer1 = Customer.create!(first_name: "Joey", last_name: "Ondricka")
      @customer2 = Customer.create!(first_name: "Cecelia", last_name: "Osinski")
      @customer3 = Customer.create!(first_name: "Mariah", last_name: "Toy")
      @customer4 = Customer.create!(first_name: "Leanne", last_name: "Braun")
      @customer5 = Customer.create!(first_name: "Sylvester", last_name: "Nader")
      @customer6 = Customer.create!(first_name: "Heber", last_name: "Kuhn")
      @customer7 = Customer.create!(first_name: "Parker", last_name: "Daugherty")

      @invoice1 = Invoice.create!(status: "completed", customer_id: @customer1.id, created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC")
      @invoice2 = Invoice.create!(status: "completed", customer_id: @customer2.id, created_at: "2012-03-12 05:54:09 UTC", updated_at: "2012-03-12 05:54:09 UTC")
      @invoice3 = Invoice.create!(status: "completed", customer_id: @customer3.id, created_at: "2012-03-10 00:54:09 UTC", updated_at: "2012-03-10 00:54:09 UTC")
      @invoice4 = Invoice.create!(status: "completed", customer_id: @customer4.id, created_at: "2012-03-24 15:54:10 UTC", updated_at: "2012-03-24 15:54:10 UTC")
      @invoice5 = Invoice.create!(status: "completed", customer_id: @customer5.id, created_at: "2012-03-07 19:54:10 UTC", updated_at: "2012-03-07 19:54:10 UTC")
      @invoice6 = Invoice.create!(status: "completed", customer_id: @customer6.id, created_at: "2012-03-09 01:54:10 UTC", updated_at: "2012-03-09 01:54:10 UTC")
      @invoice7 = Invoice.create!(status: "completed", customer_id: @customer7.id, created_at: "2012-03-07 21:54:10 UTC", updated_at: "2012-03-07 21:54:10 UTC")
      @invoice8 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-13 16:54:10 UTC", updated_at: "2012-03-13 16:54:10 UTC")
      @invoice9 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      @invoice10 = Invoice.create!(status: "cancelled", customer_id: @customer7.id, created_at: "2012-03-06 21:54:10 UTC", updated_at: "2012-03-06 21:54:10 UTC")
      @invoice11 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-08 20:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
    end

    describe "#self.incomplete_by_creation_date" do
      it "gives all invoices with a status of in progress" do
        expect(Invoice.incomplete_by_creation_date).to eq([@invoice9, @invoice11, @invoice8])
      end
    end

    describe "#creation_date" do
      it "gives the date of creation in a specific format" do 
        expect(@invoice11.creation_date).to eq("Thursday, March 8, 2012")
      end
    end

    describe "#customer_name" do
      it "can give the full name of a customer associated with a given invoice" do
        expect(@invoice11.customer_name).to eq("Parker Daugherty")
      end
    end
  end
end