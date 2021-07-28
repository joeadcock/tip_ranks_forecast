RSpec.describe TipRanksForecast do
  it 'has a version number' do
    expect(TipRanksForecast::VERSION).not_to be nil
  end

  describe 'Stock' do
    before do
      WebmockHelper.stub_requests
    end

    let(:stock) { TipRanksForecast::Stock.new('AAPL') }

    describe 'buy_ratings' do
      subject { stock.buy_ratings }

      it { is_expected.to eq 17 }
    end

    describe 'high_forecast' do
      subject { stock.high_forecast }

      it { is_expected.to eq 18500 }
    end

    describe 'hold_ratings' do
      subject { stock.hold_ratings }

      it { is_expected.to eq 5 }
    end

    describe 'low_forecast' do
      subject { stock.low_forecast }

      it { is_expected.to eq 9000 }
    end

    describe 'num_analysts' do
      subject { stock.num_analysts }

      it { is_expected.to eq 24 }
    end

    describe 'price_target' do
      subject { stock.price_target }

      it { is_expected.to eq 15833 }
    end

    describe 'sell_ratings' do
      subject { stock.sell_ratings }

      it { is_expected.to eq 2 }
    end
  end
end
