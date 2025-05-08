require "test_helper"

class MovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movement = movements(:one)
  end

  test "should get index" do
    get movements_url, as: :json
    assert_response :success
  end

  test "should create movement" do
    assert_difference("Movement.count") do
      post movements_url, params: { movement: { datetime: @movement.datetime, movement_type: @movement.movement_type, product_id: @movement.product_id, quantity: @movement.quantity, reason: @movement.reason, user_id: @movement.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show movement" do
    get movement_url(@movement), as: :json
    assert_response :success
  end

  test "should update movement" do
    patch movement_url(@movement), params: { movement: { datetime: @movement.datetime, movement_type: @movement.movement_type, product_id: @movement.product_id, quantity: @movement.quantity, reason: @movement.reason, user_id: @movement.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy movement" do
    assert_difference("Movement.count", -1) do
      delete movement_url(@movement), as: :json
    end

    assert_response :no_content
  end
end
