require File.dirname(__FILE__) + '/../test_helper'
require 'kontakt_controller'

# Re-raise errors caught by the controller.
class KontaktController; def rescue_action(e) raise e end; end

class KontaktControllerTest < Test::Unit::TestCase
  def setup
    @controller = KontaktController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end