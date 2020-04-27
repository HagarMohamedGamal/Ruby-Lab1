class ItemSerializer < ActiveModel::Serializer
  def item_name
    object.name
  end
  def item_description
    object.description
  end
  attributes :item_name, :item_description
  # def item_name
  #   ItemSerializer.new(object.name, root: false)
  # end
end
