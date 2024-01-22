class InsultsController < ApplicationController

  def index
    insult_formats = ['gonna test noun out']
    insult = insult_formats.sample
    noun = Noun.all.sample.noun
    insult.gsub!('noun', noun)
    render json: insult
  end
end