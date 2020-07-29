class GroupSerializer < ActiveModel::Serializer
  attributes :id, :description, :children_label, :parent, :require_id

  def parent
    if object.parent == nil
      return nil
    end
    { name: object.parent.description, id: object.parent.id }
  end
end
