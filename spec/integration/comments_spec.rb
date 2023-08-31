require 'swagger_helper'

describe 'Comments API' do
  path '/api/v1/users/{user_id}/posts/{id}' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'comment created' do
        let(:pet) { { name: 'Details..' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:pet) { { name: 'Details..' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts' do
    get 'Retrieves posts comments' do
      tags 'Comments'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'comments found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 author: {type: :object},
                 comments: { type: :object,
                             properties: {
                               id: { type: :integer },
                               text: { type: :string }
                             } }
               },
               required: %w[id title comments]

        let(:id) { Comment.create(text: 'Details..', author_id: 1, post_id: 1).id }
        run_test!
      end

      response '404', 'comments not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
