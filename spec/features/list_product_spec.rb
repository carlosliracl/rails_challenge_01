require "rails_helper"

RSpec.feature "list products" do
    before(:all) do
        Product.delete_all

        @product1 = Product.create(sku: "SKUCODE1", 
            name: "T-Shirt Male", 
            description: "Color: Red, Size: M", 
            quantity: 10, 
            price: 59.90)

        @product2 = Product.create(sku: "SKUCODE2", 
            name: "T-Shirt Female", 
            description: "Color: Pink, Size: P", 
            quantity: 10, 
            price: 49.90)
    end

    after(:all) do
      Product.delete_all
    end
    

    it "list all products" do
        visit "/"

        expect(page).to have_link(@product1.sku)
        expect(page).to have_content(@product1.name)
        expect(page).to have_content(@product1.description)
        expect(page).to have_content(@product1.quantity)
        expect(page).to have_content(@product1.price)

        expect(page).to have_link(@product2.sku)
        expect(page).to have_content(@product2.name)
        expect(page).to have_content(@product2.description)
        expect(page).to have_content(@product2.quantity)
        expect(page).to have_content(@product2.price)
    end

    it "shows a message when there is no products" do
        Product.delete_all

        visit "/"

        expect(page).not_to have_link(@product1.sku)
        expect(page).not_to have_content(@product1.name)
        expect(page).not_to have_content(@product1.description)
        expect(page).not_to have_content(@product1.quantity)
        expect(page).not_to have_content(@product1.price)

        expect(page).not_to have_link(@product2.sku)
        expect(page).not_to have_content(@product2.name)
        expect(page).not_to have_content(@product2.description)
        expect(page).not_to have_content(@product2.quantity)
        expect(page).not_to have_content(@product2.price)

        within("h1#no-products") do
            expect(page).to have_content("No products created")
        end

    end
end