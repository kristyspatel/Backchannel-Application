require 'test_helper'

class ReplyVotesControllerTest < ActionController::TestCase
  setup do
    @reply_vote = reply_votes(:reply_votes_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reply_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reply_vote" do
    assert_difference('ReplyVote.count') do
      post :create, reply_vote: {  }
    end

    assert_redirected_to reply_vote_path(assigns(:reply_vote))
  end

  test "should show reply_vote" do
    get :show, id: @reply_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reply_vote
    assert_response :success
  end

  test "should update reply_vote" do
    put :update, id: @reply_vote, reply_vote: {  }
    assert_redirected_to reply_vote_path(assigns(:reply_vote))
  end

  test "should destroy reply_vote" do
    assert_difference('ReplyVote.count', -1) do
      delete :destroy, id: @reply_vote
    end

    assert_redirected_to reply_votes_path
  end
end
