require 'rails_helper'

RSpec.feature 'Remove a product' do
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

  it 'removes a product successfully' do
    visit '/'

    click_link @product.sku

    click_link 'Delete'

    expect(page.current_path).to eq(products_path)
    expect(page).not_to have_content(@product.sku)
    expect(page).to have_content('Produto removido com sucesso')
  end
end