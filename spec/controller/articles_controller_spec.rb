require "rails_helper"

RSpec.describe ArticleController, :type => :controller do
  let(:user) {User.cret!(email: "author@example.com", password:"12345678", password_confirmation: "12345678")}

  before(:each) do
    sign_in user
  end

  describe 'Get index' do
    it "returns 200 (ok) response code" do
      get :index
      expect(response).to have_http_status(ok)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "leaves an empty relationship on @articles if there are no articles" do
      get :index
      expect(assigns(:articles)).to be_empty
    end

    it "assigns the latest 10 post to @articles" do
      Article.create!(title: "Post number 1", text: "My first post!", author: user)
      last_article = (2..11).map do |i|
        Article.create!(title: "Post number #{i}", text: "My #{i} post!", author: user)
      end
      get :index
      expect(assigns(:articles)).to eq(last_article.reverse)
    end    
  end

end
