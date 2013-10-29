require 'spec_helper'

describe Admin::PostsController do
  describe "admin panel" do
    it "#index" do
      get :index
      response.status.should eq 200
    end

    it "#new" do
      get :new
      response.status.should eq 200
    end

    context "#create" do
      it "creates a post with valid params" do
        expect {
          post :create, :post => {title: "salar", content: "sux"}
        }.to change(Post, :count).by(1)
        expect(Post.last.title).to eq("Salar")
      end
      it "doesn't create a post when params are invalid" do
        post :create, :post => {title: nil, content: nil}
        response.should render_template("new")
      end
    end

    context "#update" do
      let(:post) { Post.create(title: "salar", content:"haha") }

      it "#edit" do
        get :edit, id: post.id
        response.status.should eq 200
      end
      it "updates a post with valid params" do
        put :update, id: post.id, :post => { content: 'really sux' }
        expect(Post.find(post.id).content).to eq('really sux')
      end
      it "doesn't update a post when params are invalid" do
        put :update, id: post.id, :post => { content: '' }
        response.should render_template("edit")
      end
    end

    context "#destroy" do
      let!(:post) { Post.create(title: "salar", content:"haha") }

      it "should destroy post" do
        expect {
          delete :destroy, id: post.id
        }.to change(Post, :count).by(-1)
        expect(Post.all).not_to include(post)
      end
    end
  end
end
