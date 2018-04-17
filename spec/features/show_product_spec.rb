require 'rails_helper'

RSpec.feature 'Shows product details' do
    before(:all) do
        Product.delete_all

        @product = Product.create(sku: 'SKUCODE', 
            name: 'T-Shirt', 
            description: 'Color: Red, Size: M', 
            quantity: 20, 
            price: 99.90)
    end

    after(:all) do
      Product.delete_all
    end

    it 'shows product details' do
        visit '/'

        click_link @product.sku

        expect(page.current_path).to eq(product_path(@product))
        expect(page).to have_content(@product.sku)
        expect(page).to have_content(@product.name)
        expect(page).to have_content(@product.description)
        expect(page).to have_content(@product.quantity)
        expect(page).to have_content(@product.price)
    end
end