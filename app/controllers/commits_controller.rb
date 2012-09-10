class CommitsController < ApplicationController
  
  
  def create
    if params[:payload]
      @payload = Payload.new(params[:payload])
      result = @payload.save! 
    end
    head :ok
  end
  
end
