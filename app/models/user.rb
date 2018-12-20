class User < ApplicationRecord

  def by_level(level)
    Test.where(level: level).
        joins("inner join test_passages on test_passages.test_id = tests.id").
        where("test_passages.user_id = ?", self.id)
  end
end
