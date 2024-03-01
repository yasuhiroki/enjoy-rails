require "application_system_test_case"

class UserNotesTest < ApplicationSystemTestCase
  setup do
    @user_note = user_notes(:one)
  end

  test "visiting the index" do
    visit user_notes_url
    assert_selector "h1", text: "User notes"
  end

  test "should create user note" do
    visit user_notes_url
    click_on "New user note"

    fill_in "Note", with: @user_note.note
    fill_in "User", with: @user_note.user_id
    click_on "Create User note"

    assert_text "User note was successfully created"
    click_on "Back"
  end

  test "should update User note" do
    visit user_note_url(@user_note)
    click_on "Edit this user note", match: :first

    fill_in "Note", with: @user_note.note
    fill_in "User", with: @user_note.user_id
    click_on "Update User note"

    assert_text "User note was successfully updated"
    click_on "Back"
  end

  test "should destroy User note" do
    visit user_note_url(@user_note)
    click_on "Destroy this user note", match: :first

    assert_text "User note was successfully destroyed"
  end
end
