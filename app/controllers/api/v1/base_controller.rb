# frozen_string_literal: true

class Api::V1::BaseController < Api::ApiController
  before_action :authenticate_administrator!
end
