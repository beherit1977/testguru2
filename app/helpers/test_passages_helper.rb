module TestPassagesHelper
  def percent_and_msg(test_passage)
    result = Struct.new(:color, :message)
    if test_passage.current_percent(test_passage) >= 85
      result.new(:green, :success)
    else
      result.new(:red, :fail)
    end
  end
end
