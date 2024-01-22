class AdjectivesController < ApplicationController

  def create
    new_adjective = Adjective.new(adjective_params)
    require 'pry';binding.pry
    if new_adjective.save
      render json: AdjectiveSerializer.new(new_adjective)
    else
      render json: "Error adjective can't be blank"
    end
  end

  private

  def adjective_params
    params.permit(:adjective)
  end
end