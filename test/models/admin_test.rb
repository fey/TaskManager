require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test 'create' do
    user = create(:admin)
    assert user.persisted?
  end
end
