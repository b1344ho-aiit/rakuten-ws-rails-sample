class ItemsearchController < ApplicationController
  def index
    render 'itemsearch/index'
  end

  def search
    keyword = params['keyword']
    httpClient = HTTPClient.new

    @jsonData = nil
    @errorMeg = nil

    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/IchibaItem/Search/20130805', {
          'applicationId' => '1045614944036803158',
          'affiliateId'   => '11b23d9a.308a9931.11b23d9b.657b98be',
          'keyword'       => keyword
      })
      @jsonData = JSON.parse data
      p @jsonData
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end

    render 'itemsearch/index'
  end
end
