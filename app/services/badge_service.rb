class BadgeService

  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    @test_passage = test_passage
  end
  
  def call
    Badge.all.find_each do |badge|
      add_badge(badge) if send("reward_by_#{badge.rule_type}?", badge.rule_value)
    end
  end

  def reward_by_first_time_succeed?(param)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.success_test?
  end  
    
  def reward_by_category?(title)
    p User.all
    p title
    category = Category.find_by(title: title)
    success_tests.map(&:test_id).uniq.count == category.tests.count
  end
  
  def reward_by_level?(level)
    tests_ids = Test.where(level: level).ids

    (tests_ids - successful_uniq_ids).empty?
  end
  
  def success_tests
    TestPassage.where(user: @user, test: @test, current_question: nil)
               .select(&:success_test?)
  end
  
  def successful_uniq_ids
    @user.successful_tests.map(&:test_id).uniq
  end

  def add_badge(badge)
    @user.badges << badge
  end
end