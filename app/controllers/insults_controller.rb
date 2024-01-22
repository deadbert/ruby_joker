class InsultsController < ApplicationController

  def index
    insult = gen_insult
    render json: insult
  end

  def create
    new_insult = InsultFormat.new(insult_params)
    if new_insult.save
      render json: InsultFormatSerializer.new(new_insult)
    else
      render json: "Error insult format can't be blank"
    end
  end

  private

  def gen_insult
    insult = InsultFormat.all.sample.insult_format
    noun = Noun.all.sample.noun
    verb = Verb.all.sample.verb
    adjective = Adjective.all.sample.adjective
    insult.gsub!('noun', noun)
    insult.gsub!('verb', verb)
    insult.gsub!('adjective', adjective)
    insult
  end

  def insult_params
    params.permit(:insult_format)
  end
end