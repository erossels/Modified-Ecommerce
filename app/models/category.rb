class Category < ApplicationRecord
  has_and_belongs_to_many :products
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Category", foreign_key: "parent_id", optional: true
  validates :name, presence: true, uniqueness: {case_sensitive: true}

  def parents(category = self)
    @parents_results ||= []
    return @parents_results if category.parent.nil?

    @parents_results << parent
    parents(category.parent)
  end

  def find_children(category = self.subcategories)
    current_children = subcategories.to_a
    children_to_return = []
    while current_children.present?
      current_node = current_children.shift
      children_to_return << current_node
      current_children.concat(current_node.subcategories)
    end
    children_to_return
  end

end
