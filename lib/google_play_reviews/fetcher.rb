require "json"
require "uri"
require "net/http"
require "nokogiri"
require "openssl"

module GooglePlayReviews
  class Fetcher
    GOOGLE_PLAY_ROOT_URL = "https://play.google.com"
    GET_REVIEWS_URL = "https://play.google.com/store/getreviews"

    attr_accessor :app_id, :options

    def fetch_entries(app_id, options = {})
      @app_id = app_id
      @options = options
      html = fetch_html_from_google_play
      extract_entries(html)
    end

    private

      def fetch_html_from_google_play
        uri = URI.parse(GET_REVIEWS_URL)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(uri.path)
        request.set_form_data({
          id: app_id,
          reviewSortOrder: @options[:sort_order],
          reviewType: 1,
          pageNum: @options[:page],
          xhr: 1,
          hl: "en",
        })
        response = http.start do |h|
          h.request(request)
        end
        JSON.parse(response.body[5..-1])[0][2]
      end

      def extract_entries(html)
        entries = []
        doc = Nokogiri::HTML(html, nil, 'utf-8')
        review_nodes = doc.css(".single-review")
        review_nodes.each do |node|
          review_id = node.css(".review-header").first["data-reviewid"]
          entry = Entry.new
          entry.review_id = review_id.strip
          if node.css(".author-name a").first
            entry.author_name = node.css(".author-name a").first.content
            entry.author_url = GOOGLE_PLAY_ROOT_URL + node.css(".author-name a").first["href"]
            entry.author_image_url = node.css(".author-image").first["src"]
          end
          node.css(".review-body").first.css("a").remove
          entry.review_body = node.css(".review-body").first.text.strip
          entry.rating = node.css(".current-rating").first["style"].gsub(/[^0-9]/, '').to_i / 20
          entry.review_date_string = node.css(".review-date").first.text
          entry.review_url = GOOGLE_PLAY_ROOT_URL + node.css("a.reviews-permalink").first["href"]
          entries << entry
        end
        entries
      end
  end
end
