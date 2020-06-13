class ThingsController < ApplicationController

  skip_forgery_protection

  before_action :authenticate_access
  rescue_from Account::NotAuthorized, with: :account_not_authorized

  def authenticate_access
    api_key = request.headers['API-KEY']

    # assume you have an Account table with a field api_key
    if ! Account.where(api_key: api_key).any?
      raise Account::NotAuthorized
    end
  end

  def index
    @things = Thing.all
    respond_to do |format|
      format.json { render json: @things.as_json }
    end
  end


  def edit
    @thing = Thing.find(params[:id])
    respond_to do |format|
      format.json { render json: @thing.as_json }
    end
  end
end

