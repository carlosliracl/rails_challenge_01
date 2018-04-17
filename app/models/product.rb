class Product
  include Mongoid::Document
  include FormattedCurrency

  field :sku, type: String
  field :name, type: String
  field :description, type: String
  field :quantity, type: Integer
  field :price, type: Float

  validates :sku, presence: true #, unique: true
  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true, numericality: {only_integers: true}
  validates :price, presence: true, numericality: {}

  index({ sku: 1 }, { unique: true, name: 'sku_index' })
end
