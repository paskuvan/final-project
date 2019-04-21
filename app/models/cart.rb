class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = lines_items.find_by(instrument_id: instrument.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line.items.build(product_id: product.id)
  end
  current_item
end

end
