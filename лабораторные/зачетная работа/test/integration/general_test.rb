require_relative "../test_helper.rb"

class GeneralTest < ActionDispatch::IntegrationTest
  test "should login" do
    User.create(login: 'olololo', password: 'olololo', role: 'user')
    post "/session/create", {login: 'olololo', password: 'olololo'}
    get "/users/show/#{session[:current_user_id].to_s}"
    assert_response :success
  end

  test "should not work unlogged" do
    u = User.create(login: 'olololo', password: 'olololo', role: 'user')
    get "/users/show/#{u.id.to_s}"
    assert_redirected_to root_url
   end

  test "should create product" do
    User.create(login: 'olololo', password: 'olololo', role: 'admin')
	#Product.create(name: 'coffee', about: 'gfsaghhas', img: 'ghasfhga.img', price: 100)
    post "/session/create", {login: 'olololo', password: 'olololo'}
    post products_url, params: { product: { about: 'gfsaghhas', img: 'ghasfhga.img', name: 'coffee', price: 100 } }
    assert_redirected_to product_url(Product.last)
  end

end
