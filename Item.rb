class Item
  attr_reader :item_name, :item_price, :sale_price

  def initialize(item_name, item_price, sale_price)
    @item_name = item_name
    @item_price = item_price
    @sale_price = sale_price
  end

  def item_price
    @item_price
  end

  def item_name
    @item_name
  end

  def sale_price
    @sale_price
  end

end