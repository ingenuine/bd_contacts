require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should show contact" do
    get contact_url(@contact), headers: headers
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact), headers: headers
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { address: @contact.address, first_name: @contact.first_name, last_name: @contact.last_name, mobile_number: @contact.mobile_number, title: @contact.title } }, headers: headers
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact), headers: headers
    end

    assert_redirected_to contacts_url
  end
end
