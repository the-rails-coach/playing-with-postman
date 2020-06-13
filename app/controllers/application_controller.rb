class ApplicationController < ActionController::Base
  private

  def account_not_authorized
    flash[:error] = "You don't have access to this section."

    respond_to do |format|
      format.json {  render json: {"response": flash[:error]}}
      format.html {   render flash[:error], layout: false}
    end
  end
end
