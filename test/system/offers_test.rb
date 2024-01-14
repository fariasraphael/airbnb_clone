require 'application_system_test_case'

class OffersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    login_as users(:raphael)
    visit root_path

    assert_selector 'h1', text: 'Awesome Places'
    assert_selector '.card-trip', count: Offer.count
    save_and_open_screenshot
  end

  test 'lets a signed in user create a new product' do
    login_as users(:raphael)
    visit root_path
    find('#navbarDropdown').click
    click_on 'Airbnb your home'

    fill_in 'offer_title', with: 'Le Wagon'
    fill_in 'offer_description', with: 'Change your life: Learn to code'
    fill_in 'offer_price', with: 30_000.00
    fill_in 'offer_number_of_guests', with: 12
    fill_in 'offer_address', with: 'panema Business - R. Visc. de Pirajá, 142'

    click_on "Create Offer"
    assert_text 'Change your life: Learn to code'
    assert_equal offer_path(Offer.last), page.current_path
    save_and_open_screenshot
  end
# # end
# # test 'visiting the index' do
#   #   login_as users(:raphael)
#   #   visit root_path

#   #   assert_selector 'h1', text: 'Awesome Places'
#   #   assert_selector '.card-product', count: Offer.count
#   #   #save_and_open_screenshot
#   # end

#   # test 'lets a signed in user create a new product' do
#   #   login_as users(:raphael)
#   #   visit '/offers/new'
#   #   #save_and_open_screenshot

#   #   fill_in 'offer_title', with: 'Le Wagon'
#   #   fill_in 'offer_description', with: 'Change your life: Learn to code'

#   #   click_on "Create Offer"

#   #   assert_text 'Change your life: Learn to code'
#   #   assert_equal root_path, page.current_path
end
