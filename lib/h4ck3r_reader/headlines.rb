class H4ck3rReader::Headlines
  attr_accessor :headline, :url, :site

  @@all = []

  def self.new_from_homepage(article)
    self.new(
      article.css("a.storylink").text,
      article.css("a")[0]["href"],
      article.css("span.sitestr").text
    )
  end

  def initialize(headline = nil, url = nil, site = nil)
    @headline = headline
    @url = url
    @site = site
    @@all << self
  end

  def self.all
    @@all
  end

end
