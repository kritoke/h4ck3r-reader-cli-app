class H4ck3rReader::Headlines
  attr_accessor :rank, :title, :url, :site

  @@all = []

  def self.new_from_homepage(article)
    self.new(
      article.css("span.rank").text,
      article.css("a.storylink").text,
      article.css("td.title a")[0]["href"],
      article.css("span.sitestr").text
    )
  end

  def initialize(rank = nil, title = nil, url = nil, site = nil)
    @rank = rank
    @title = title
    # fix issue with local url content
    url.include?("item?id=") ? @url = "https://news.ycombinator.com/" + url : @url = url
    @site = site
    @@all << self
  end

  def self.all
    @@all
  end

end
