class NounsController < ApplicationController

  def create
    new_noun = Noun.new(noun_params)
    if new_noun.save 
      render json: NounSerializer.new(new_noun)
    else 
      render json: new_noun.errors.full_messages
    end
  end

  def index
    render json: NounSerializer.new(Noun.all)
  end

  private

  def noun_params
    params.permit(:noun)
  end
end