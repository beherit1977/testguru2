class Test < ApplicationRecord
  def self.by_category(name)
    Test.where("categories.title = ?", name).
        joins("inner join categories on categories.id = tests.category_id").
        order(id: :desc).
        pluck(:title)
  end
end
