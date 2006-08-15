require File.dirname(__FILE__) + '/../test_helper'
require 'produkter_controller'

# Re-raise errors caught by the controller.
class ProdukterController; def rescue_action(e) raise e end; end

class ProdukterControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProdukterController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
