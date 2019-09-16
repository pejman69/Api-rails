require 'rails_helper'


RSpec.describe CommentsController, type: :controller do
  let(:article) { create :article}
  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {article_id: article_id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
      let(:valid_attributes) { { content: 'My awesome comment fo article' } 
      let(:invalid_attributes) { {content:''} }

        context "with valid params" do
          it "creates a new Comment" do
            expect {
              post :create, params: { article_id: article.id, comment: valid_attributes}
            }.to change(Comment, :count).by(1)
          end

          it "renders a JSON response with the new comment" do

            post :create, params: { article_id: article.id, comment: valid_attributes}
            expect(response).to have_http_status(:created)
            expect(response.content_type).to eq('application/json')
            expect(response.location).to eq(article_url(article))
          end
        end

        context "with invalid params" do
          it "renders a JSON response with errors for the new comment" do
     
              post :create, params: { article_id: article.id, comment: invalid_attributes}
              expect(response).to have_http_status(:unprocessable_entity)
              expect(response.content_type).to eq('application/json')
      end
    end
  end
end
