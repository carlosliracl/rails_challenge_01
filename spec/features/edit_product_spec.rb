require 'rails_helper'

RSpec.feature 'An user tries to update a product' do
  before(:all) do
    Product.delete_all

    @product = Product.create(
      sku: 'SKUCODE',
      name: 'T-Shirt',
      description: 'Color: Red, Size: M',
      quantity: 20,
      price: 99.90
    )
  end

  after(:all) do
    Product.delete_all
  end

  it 'updates a product successfully' do
    visit '/'

    click_link @product.sku
    click_link 'Edit product'

    product_sku = '0284302'
    product_name = 'T-Shirt B2W'
    product_description = 'SkyHub Team T-Shirt' 
    product_price = 89.90
    product_quantity = 19

    fill_in 'Sku', with: product_sku
    fill_in 'Name', with: product_name
    fill_in 'Description', with: product_description
    fill_in 'Quantity', with: product_quantity
    fill_in 'Price', with: product_price

    click_button 'Update Product'

    expect(page.current_path).to eq(products_path)
    expect(page).to have_content('O produto foi atualizado')
    expect(page).to have_link(product_sku)
    expect(page).to have_content(product_name)
    expect(page).to have_content(product_description)
    expect(page).to have_content(product_quantity)
    expect(page).to have_content(product_price)
  end

  it 'fails to update a product' do
    visit '/'

    visit edit_product_path(@product)

    fill_in 'Sku', with: ''
    fill_in 'Name', with: ''
    fill_in 'Description', with: ''
    fill_in 'Quantity', with: ''
    fill_in 'Price', with: ''

    click_button 'Update Product'

    # expect(page.current_path).to eq(products_path)
    expect(page).to have_content('Houve um erro ao atualizar o produto')
  end
end
