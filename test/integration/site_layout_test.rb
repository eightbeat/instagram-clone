require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "links" do
    get root_path
    assert_template 'top/home'
    assert_select "a[href=?]", root_path, count: 0
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
  end
end
