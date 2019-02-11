module TestPassagesHelper
  def test_passage_result
    result = Struct.new(:color, :message)
    if @test_passage.success_test?
      result.new(:green, t('helpers.test_passages_helper.success'))
    else
      result.new(:red, t('helpers.test_passages_helper.fail'))
    end
  end
end
