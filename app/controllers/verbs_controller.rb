class VerbsController < ApplicationController

  def create
    new_verb = Verb.new(verb_params)
    if new_verb.save
      render json: VerbSerializer.new(new_verb)
    else
      render json: "Verb can't be blank"
    end
  end

  def index
    render json: VerbSerializer.new(Verb.all)
  end

  private

  def verb_params
    params.permit(:verb)
  end
end