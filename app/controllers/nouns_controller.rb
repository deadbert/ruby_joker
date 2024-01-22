class NounsController < ApplicationController

  def create
    new_noun = Noun.new(noun: params[:noun])
    if new_noun.save 
      render json: NounSerializer.new(new_noun)
    else 
      render json: new_noun.errors.full_messages
    end
  end
end