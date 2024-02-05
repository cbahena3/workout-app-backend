require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: 'test@example.com', password: 'password')

    post "/sessions", params: { email: @user.email, password: "password" }
    assert_response :created

    @token = JSON.parse(response.body)["jwt"]
  end

  test "index" do
    get "/users.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal User.count, data.length
  end

  test "show" do
    get "/users/#{User.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "email", "image_url"], data.keys
  end

  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", image_url: 'image'}
      assert_response 201
    end
  end

  test "update" do
    user = User.first
    patch "/users/#{user.id}.json", params: { name: "Updated name" }, headers: { Authorization: "Bearer #{@token}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "User.count", -1 do
      delete "/users/#{@user.id}.json", headers: { Authorization: "Bearer #{@token}" }
      assert_response 200
    end
  end
end

#Create and update users test is failing because password/passwordconfirmation dont get sent as params for some reason and nil for name on update.
