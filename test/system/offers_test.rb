require 'application_system_test_case'

class OffersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit root_path

    assert_selector 'h1', text: 'Awesome Places'
    assert_selector '.card-product', count: Offer.count
    save_and_open_screenshot
  end

  test 'lets a signed in user create a new product' do
    login_as users(:raphael)
    visit '/offers/new'
    save_and_open_screenshot

    fill_in 'offer_title', with: 'Le Wagon'
    fill_in 'offer_description', with: 'Change your life: Learn to code'


    click_on "Create Offer"
    save_and_open_screenshot

    assert_text 'Change your life: Learn to code'
    assert_equal root_path, page.current_path
    save_and_open_screenshot
  end
end
