require "application_system_test_case"

class TestPassagesTest < ApplicationSystemTestCase
  setup do
    @test_passage = test_passages(:one)
  end

  test "visiting the index" do
    visit test_passages_url
    assert_selector "h1", text: "Test Passages"
  end

  test "creating a Test passage" do
    visit test_passages_url
    click_on "New Test Passage"

    click_on "Create Test passage"

    assert_text "Test passage was successfully created"
    click_on "Back"
  end

  test "updating a Test passage" do
    visit test_passages_url
    click_on "Edit", match: :first

    click_on "Update Test passage"

    assert_text "Test passage was successfully updated"
    click_on "Back"
  end

  test "destroying a Test passage" do
    visit test_passages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test passage was successfully destroyed"
  end
end
