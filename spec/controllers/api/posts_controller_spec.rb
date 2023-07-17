require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do 
    describe '[GET] #show' do 
    let(:post) { create :post }

        context 'when params are valid' do 
            before { get :show, params: { id: post.id } }

            it do
                expect(response).to have_http_status(:ok)
                expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new(post).to_json)
            end
        end

        context 'when params are invalid' do
            before { get :show, params: { id: 'InvalidId' } }

            it do 
                expect(response).to have_http_status(:not_found)
                expect(JSON.parse(response.body)['errors']).to eq('Record not found')
            end
        end
    end
end