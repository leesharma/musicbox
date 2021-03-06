require 'test_helper'

class FactoriesTest < ActiveSupport::TestCase
  FactoryGirl.factories.map(&:name).each do |factory_name|
    test "The #{factory_name} factory is valid" do
      assert build(factory_name).valid?
    end
  end
end
