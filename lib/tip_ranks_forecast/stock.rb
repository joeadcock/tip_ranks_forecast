require 'open-uri'
require 'nokogiri'

module TipRanksForecast
  class Stock
    attr_reader :symbol

    CONSENSUS = /(\d+)\D+(\d+)\D+(\d+)\D+(\d+)/

    def initialize(symbol)
      @symbol = symbol.downcase
    end

    def buy_ratings
      search(consensus_data, CONSENSUS, 2).to_i
    end

    def high_forecast
      currency_int(search(price_target_data, /high forecast of \$([0-9,.]+)/))
    end

    def hold_ratings
      search(consensus_data, CONSENSUS, 3).to_i
    end

    def low_forecast
      currency_int(search(price_target_data, /low forecast of \$([0-9,.]+)/))
    end

    def num_analysts
      search(price_target_data, /Based on (\d+)/).to_i
    end

    def price_target
      currency_int(search(price_target_data, /Average Price Target\$([0-9,.]+)/))
    end

    def sell_ratings
      search(consensus_data, CONSENSUS, 4).to_i
    end

    private

    def consensus_data
      @consensus_data ||= data_sc('consensus')
    end

    def currency_int(amount)
      (amount.tr(',','').to_f * 100).round
    end

    def data_sc(value)
      doc.xpath('//div/@data-sc').find { |a| a.value == value }&.parent&.text
    end

    def doc
      return @doc if @doc

      html = URI.open("https://www.tipranks.com/stocks/#{symbol}/forecast")
      @doc = Nokogiri::HTML(html)
    end

    def price_target_data
      @price_target_data ||= data_sc('priceTarget')
    end

    def search(str, regex, i = 1)
      str.match(regex)[i]
    end
  end
end
