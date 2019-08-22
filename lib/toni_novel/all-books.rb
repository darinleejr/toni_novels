class ToniNovels::AllNovels
  attr_accessor :name, :price, :availability, :url

  def self.today
    self.scrape_novels
  end

    # puts <<~DOC
    #   1. The Bluest Eye by Toni Morrison - $19.43
    #   2. Sula by Toni Morrison - $19.84
    #   3. Beloved by Toni Morrison - $32.00
    # DOC

  def price
    @amazon_doc ||= Nokogiri::HTML(open(self.url))
    novel.price = @amazon_doc.search('')
  end

  def self.scrape_novels
    #Alt website: https://www.amazon.com/gp/product/
    doc = Nokogiri::HTML(open("https://www.bookseriesinorder.com/toni-morrison/"))
    novel_list = doc.search("tr")

    novel_list.map do |novel_tr|
      novel = self.new
      #Alt website: https://www.amazon.com/gp/product/0394535979/
      #Beloved
      novel.name = novel_tr.search("td.booktitle").text.strip

      novel.url = novel_tr.search("a").first.attr("href").strip

      novel.availability = true
      novel
    end
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
