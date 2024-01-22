class AdjectivesController < ApplicationController

  def create
    new_adjective = Adjective.new(adjective_params)
    if new_adjective.save
      render json: AdjectiveSerializer.new(new_adjective)
    else
      render json: "Error adjective can't be blank"
    end
  end

  def index
    render json: AdjectiveSerializer.new(Adjective.all)
  end

  private

  def adjective_params
    params.permit(:adjective)
  end
end