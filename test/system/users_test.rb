require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "creating a new user" do
    visit root_path
    assert_selector '#navbarDropdown', visible: true
    assert_selector '.fa-solid.fa-bars', visible: true

    find('.avatar').click
    assert_selector 'a', text: 'Sign up'

    click_on 'Sign up'

    fill_in 'user_email', with: 'raphael_farias@hotmail.com'
    fill_in 'user_password', with: '987654'
    fill_in 'user_password_confirmation', with: '987654'
    assert_equal new_user_registration_path, page.current_path

    click_on 'Sign up'
    assert_text 'Welcome! You have signed up successfully.'
    assert_equal root_path, page.current_path
    # save_and_open_screenshot
  end

  test 'creating a new user with already existing email' do
    visit root_path
    assert_selector '#navbarDropdown', visible: true
    assert_selector '.fa-solid.fa-bars', visible: true

    find('.avatar').click
    assert_selector 'a', text: 'Sign up'

    click_on 'Sign up'

    fill_in 'user_email', with: 'farias.raphael@gmail.com'
    fill_in 'user_password', with: '987654'
    fill_in 'user_password_confirmation', with: '987654'
    assert_equal new_user_registration_path, page.current_path

    click_on 'Sign up'
    assert_text 'Please review the problems below:'
    assert_equal new_user_registration_path, page.current_path
    assert_selector('.invalid-feedback', visible: true)
    # save_and_open_screenshot
  end

  test "log out a user" do
    login_as users(:raphael)
    visit root_path
    find('#navbarDropdown').click
    assert_selector 'a', text: 'Log out'

    click_on 'Log out'
    assert_text 'Signed out successfully.'
    # save_and_open_screenshot
  end

  test "log in a user" do
    visit root_path
    find('.avatar').click
    click_on 'Sign up'
    fill_in 'user_email', with: 'raphael_farias@hotmail.com'
    fill_in 'user_password', with: '987654'
    fill_in 'user_password_confirmation', with: '987654'
    click_on 'Sign up'
    assert_text 'Welcome! You have signed up successfully.'

    find('.avatar').click
    click_on 'Log out'
    assert_text 'Signed out successfully.'

    find('.avatar').click
    click_on 'Log in'
    fill_in 'user_email', with: 'raphael_farias@hotmail.com'
    fill_in 'user_password', with: '987654'
    click_on 'Log in'
    assert_text 'Signed in successfully.'

    # save_and_open_screenshot
  end
end
