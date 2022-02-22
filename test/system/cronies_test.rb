require "application_system_test_case"

class CroniesTest < ApplicationSystemTestCase
  setup do
    @crony = cronies(:one)
  end

  test "visiting the index" do
    visit cronies_url
    assert_selector "h1", text: "Cronies"
  end

  test "should create crony" do
    visit cronies_url
    click_on "New crony"

    fill_in "Email", with: @crony.email
    fill_in "First name", with: @crony.first_name
    fill_in "Last name", with: @crony.last_name
    fill_in "Phone", with: @crony.phone
    fill_in "Twitter", with: @crony.twitter
    click_on "Create Crony"

    assert_text "Crony was successfully created"
    click_on "Back"
  end

  test "should update Crony" do
    visit crony_url(@crony)
    click_on "Edit this crony", match: :first

    fill_in "Email", with: @crony.email
    fill_in "First name", with: @crony.first_name
    fill_in "Last name", with: @crony.last_name
    fill_in "Phone", with: @crony.phone
    fill_in "Twitter", with: @crony.twitter
    click_on "Update Crony"

    assert_text "Crony was successfully updated"
    click_on "Back"
  end

  test "should destroy Crony" do
    visit crony_url(@crony)
    click_on "Destroy this crony", match: :first

    assert_text "Crony was successfully destroyed"
  end
end
