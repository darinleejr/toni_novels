class AllNovels
  attr_accessor :name, :price, :availability, :url

  def self.today
    self.scrape_novels
  end

    # puts <<~DOC
    #   1. The Bluest Eye by Toni Morrison - $19.43
    #   2. Sula by Toni Morrison - $19.84
    #   3. Beloved by Toni Morrison - $32.00
    # DOC

  def self.scrape_novels
    novels = []

    novels << self.scrape_tbe
    novels << self.scrape_sula
    novels << self.scrape_beloved

    novels
  end

  def self.scrape_tbe
    #Alt website: https://www.amazon.com/gp/product/
    doc = Nokogiri::HTML(open("https://www.bookseriesinorder.com/toni-morrison/"))

    novel = self.new
    #Alt website: https://www.amazon.com/gp/product/0375411550/
    #The Bluest Eye
    novel.name = doc.search("span.productTitle").text.strip
    novel.price = doc.search("span.a-size-base a-color-price a-color-price").text.strip
    novel.url = doc.search("a.0375411550").first.attr("href").strip
    novel.availability = true
  end

  def self.scrape_sula
    #Alt website: https://www.amazon.com/gp/product/
    doc = Nokogiri::HTML(open("https://www.bookseriesinorder.com/toni-morrison/"))

    novel = self.new
    #Alt website: https://www.amazon.com/gp/product/0375415351/
    #Sula
    novel.name = doc.search("span.productTitle").text.strip
    novel.price = doc.search("span.a-size-base a-color-price a-color-price").text.strip
    novel.url = doc.search("a.0375415351").first.attr("href").strip
    novel.availability = true
  end

  def self.beloved
    #Alt website: https://www.amazon.com/gp/product/
    doc = Nokogiri::HTML(open("https://www.bookseriesinorder.com/toni-morrison/"))

    novel self.new
    #Alt website: https://www.amazon.com/gp/product/0394535979/
    #Beloved
    novel.name = doc.search("span.productTitle").text.strip
    novel.price = doc.search("span.a-size-base a-color-price a-color-price").text.strip
    novel.url = doc.search("a.0394535979").first.attr("href").strip
    novel.availability = true

    binding.pry
  end
end



    # novel_1 = self.new
    # novel_1.name = "The Bluest Eye"
    # novel_1.price = $20
    # novel_1.availability = true
    # novel_1.url = "https://www.amazon.com/gp/product/0375411550/ref=as_li_ss_tl?ie=UTF8&tag=bsio-20&linkCode=as2&camp=217145&creative=399369&creativeASIN=0375411550"
    #
    # novel_2 = self.new
    # novel_2.name = "Sula"
    # novel_2.price = $20
    # novel_2.availability = true
    # novel_2.url = "https://www.amazon.com/gp/product/0375415351/ref=as_li_ss_tl?ie=UTF8&tag=bsio-20&linkCode=as2&camp=217145&creative=399369&creativeASIN=0375415351"
    #
    # novel_3 = self.new
    # novel_3.name = "Beloved"
    # novel_3.price = $32
    # novel_3.availability = true
    # novel_3.url = "https://www.amazon.com/gp/product/0394535979/ref=as_li_ss_tl?ie=UTF8&tag=bsio-20&linkCode=as2&camp=217145&creative=399369&creativeASIN=0394535979"
