module TestPassagesHelper
  def test_passage_result
    result = Struct.new(:color, :message)
    if @test_passage.success_test?
      result.new(:green, 'Successfully completed')
    else
      result.new(:red, 'Try again')
    end
  end
end
