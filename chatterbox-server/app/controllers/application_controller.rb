class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  #get messages
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  # POST /messages
  post '/messages' do
    # creates a new message with a body and username from params
    messages = Message.create(body: params[:body], username: params[:username])
    # returns the newly created post as JSON
    messages.to_json
    end

  # POST /messages
    patch '/messages/:id' do
      # updates the body of the message using params
      message = Message.find(params[:id])
      message.update(
        body: params[:body]
      )
      # returns the updated message as JSON
      message.to_json
    end

    # DELETE /messages/:id
    delete '/messages/:id' do
        # find the review using the ID
      message = Message.find(params[:id])
        # delete the review
      message.destroy
    end
end