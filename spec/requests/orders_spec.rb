
FactoryBot.define do
    factory :order do
      product_name { Faker::Lorem.word }
      product_count { Faker::Number.number(digits: 3).to_i }
      association :customer
    end
  end
  describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response).to render_template(:show)
    end
end
describe "get new_order_path" do
    it "renders the :new template" do
      order = FactoryBot.create(:order)
        get new_order_path
        expect(response).to render_template :new
      end
 end
 
 describe "post order_path with valid data" do
    it " redirects to the order path for the entry" do
    customer = FactoryBot.create(:customer)
    order_attributes = FactoryBot.attributes_for(:order, customer_id: customer.id)
    expect { post orders_path, params: {order:  order_attributes}
    }.to change(Order, :count)
    expect(response).to redirect_to order_path(id: Order.first.id)


end
end
describe "post orders_path with invalid data" do
  it "does not save a new entry or redirect" do
    customer = FactoryBot.create(:customer)
    order_attributes = FactoryBot.attributes_for(:order)
    expect { post orders_path, params: {order: order_attributes}
  }.to_not change(Order, :count)
    expect(response).to render_template (:new)
  end
end
describe "put order_path with valid data" do
  it "updates an entry and redirects to the show path for the customer" do
    order = FactoryBot.create(:order)
    put order_path(id: order.id), params: {order: {product_name: 'orange'}}
    order.reload
    expect(order.product_name).to eq('orange')
    expect(response).to redirect_to("/orders/#{order.id}")
  end
end
describe "put order_path with invalid data" do
  it "does not update the order record or redirect" do
    order = FactoryBot.create(:order)
    put order_path(id: order.id), params: {order: {product_count: 20}}
    order.reload
    expect(order.product_count).not_to eq(20)
    expect(response).not_to redirect_to("orders#{order.id}")
  end
end


describe "delete a order record" do
  it "deletes a order record" do
    order = FactoryBot.create(:order)
  expect { delete order_path(id: order.id) }.to change(Order, :count).by(-1)
  expect(response).to redirect_to(orders_path)

end
end
