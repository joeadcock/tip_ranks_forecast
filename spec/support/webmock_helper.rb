require 'webmock'

module WebmockHelper
  def self.stub_requests
    puts "STUBBING"
    %w[aapl].each do |symbol|
      WebMock.stub_request(
        :get,
        "https://www.tipranks.com/stocks/#{symbol}/forecast"
      ).to_return(status: 200,
                  body: webmock_response("tipranks.com/stocks/#{symbol}/forecast.html"),
                  headers: {})
    end
  end

  def self.webmock_response(filename)
    File.read(
      "#{File.dirname(__FILE__)}/../fixtures/files/webmock_responses/#{filename}"
    )
  end
end
