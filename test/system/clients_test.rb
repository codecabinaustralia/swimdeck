require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Address", with: @client.address
    fill_in "Address City", with: @client.address_city
    fill_in "Address Postcode", with: @client.address_postcode
    fill_in "Address State", with: @client.address_state
    fill_in "First Name", with: @client.first_name
    fill_in "Last Name", with: @client.last_name
    fill_in "Phone 1", with: @client.phone_1
    fill_in "Phone 2", with: @client.phone_2
    fill_in "User", with: @client.user_id
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "updating a Client" do
    visit clients_url
    click_on "Edit", match: :first

    fill_in "Address", with: @client.address
    fill_in "Address City", with: @client.address_city
    fill_in "Address Postcode", with: @client.address_postcode
    fill_in "Address State", with: @client.address_state
    fill_in "First Name", with: @client.first_name
    fill_in "Last Name", with: @client.last_name
    fill_in "Phone 1", with: @client.phone_1
    fill_in "Phone 2", with: @client.phone_2
    fill_in "User", with: @client.user_id
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "destroying a Client" do
    visit clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client was successfully destroyed"
  end
end
