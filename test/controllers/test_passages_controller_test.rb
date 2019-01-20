require 'test_helper'

class TestPassagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_passage = test_passages(:one)
  end

  test "should get index" do
    get test_passages_url
    assert_response :success
  end

  test "should get new" do
    get new_test_passage_url
    assert_response :success
  end

  test "should create test_passage" do
    assert_difference('TestPassage.count') do
      post test_passages_url, params: { test_passage: {  } }
    end

    assert_redirected_to test_passage_url(TestPassage.last)
  end

  test "should show test_passage" do
    get test_passage_url(@test_passage)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_passage_url(@test_passage)
    assert_response :success
  end

  test "should update test_passage" do
    patch test_passage_url(@test_passage), params: { test_passage: {  } }
    assert_redirected_to test_passage_url(@test_passage)
  end

  test "should destroy test_passage" do
    assert_difference('TestPassage.count', -1) do
      delete test_passage_url(@test_passage)
    end

    assert_redirected_to test_passages_url
  end
end
