class CurrenciesController < ApplicationController

  def pairs_step1
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render({:template=>"rates_templates/currency_pairs.html.erb"})
  end
  def pairs_step2
    @currency_input = params.fetch(:the_currency).to_sym
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render({:template=>"rates_templates/convert_pairs.html.erb"})
  end
  def pairs_step3
    @currency_input = params.fetch(:the_currency)
    @currency_input_2 = params.fetch(:the_currency_2)
    @raw_exchangerate = open("https://api.exchangerate.host/convert?from="+ @currency_input +"&to="+ @currency_input_2).read
    @parsed_data = JSON.parse(@raw_exchangerate)
    @info= @parsed_data.fetch("info")
    @rate = @info.fetch("rate")
    render({:template=>"rates_templates/convert_result.html.erb"})
  end

end