class InsultsController < ApplicationController

  def index
    insult = gen_insult
    render json: insult
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
end