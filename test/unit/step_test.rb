require 'test_helper'

class StepTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Step.new.valid?
  end
end
