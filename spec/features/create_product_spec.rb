require 'rails_helper'


RSpec.feature 'User tries to create a product' do

  before(:all) do
    Product.delete_all
    @product_sku = '0284302'
    @product_name = 'Camiseta'
    @product_description = 'Lorem Ipsum e'
    @product_price = 22.98
    @product_quantity = 12
  end

 

  describe 'with valid data' do
    it 'create a product successfully' do
      visit '/'

      click_link 'Add product'

      fill_in 'Sku', with: @product_sku
      fill_in 'Name', with: @product_name
      fill_in 'Description', with: @product_description
      fill_in 'Quantity', with: @product_quantity
      fill_in 'Price', with: @product_price

      click_button 'Create Product'

      expect(page.current_path).to eq(products_path)
      expect(page).to have_link(@product_sku)
      expect(page).to have_content(@product_name)
      expect(page).to have_content(@product_description)
      expect(page).to have_content(@product_quantity)
      expect(page).to have_content(@product_price)
      expect(page).to have_content('O produto foi salvo')
    end

    it 'with a duplicated sku' do
      visit '/'

      click_link 'Add product'

      fill_in 'Sku', with: @product_sku
      fill_in 'Name', with: 'Shorts'
      fill_in 'Description', with: 'Lorem upsum'
      fill_in 'Quantity', with: @product_quantity
      fill_in 'Price', with: @product_price

      click_button 'Create Product'

      expect(page).to have_content('Houve um erro ao salvar o produto')
    end
  end
  describe 'with invalid data' do
    it 'with empty data' do
      visit '/'
      click_link 'Add product'
      click_button 'Create Product'

      # expect(page.current_path).to eq(new_product_path)
      expect(page).to have_content('Houve um erro ao salvar o produto')
    end
  end
end
