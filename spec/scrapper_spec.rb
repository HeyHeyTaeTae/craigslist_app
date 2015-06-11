require "./scrapper"

describe "scrapper" do 

  before(:each) do
    # use @doc in your tests to avoid hitting the
    #   craigslist url, which would be slow and 
    #   problematic if you were blocked
    @doc = Nokogiri::HTML(open("today.html"))
    @today = "Aug 12"
  end

  describe "get_todays_rows" do
    it "should return an array" do
      rows = get_todays_rows(@doc, @today)
      expect(rows.instance_of?(Array)).to be(true)
    end

    it "should select row with a .row class today's date in .date" do
      html = "<div><div class='row'><time>#{@today}</time></div></div>"
      doc = Nokogiri::HTML(html)
      rows = get_todays_rows(doc, @today)
      expect(rows.length).to eql(1)
    end

  end

  describe "filter_links" do
    it "should return an array" do
      rows = @doc.css(".row")
      links = filter_links(rows, /puppy|pup|dog/i)
      expect(links.instance_of?(Array)).to be(true)
    end
    it "should return a match for a row with the word dog" do
      # rowsString is contains one valid row
      row_text = 'Dog!'
      rowsString =  '<p class="row" data-pid="5052050272"> <a href="/sfc/pet/5052050272.html" class="i" data-ids="0:00202_l0h95t4VvXv,0:00z0z_f3JUex3IvCA"></a> <span class="txt"> <span class="star"></span> <span class="pl"> <time datetime="2015-06-10 16:43" title="Wed 10 Jun 04:43:48 PM (-292 seconds ago)">Jun 10</time> <a href="/sfc/pet/5052050272.html" data-id="5052050272" class="hdrlnk">' + row_text + '</a> </span> <span class="l2"> <span class="pnr"> <small> (Rocket Dog Rescue)</small> <span class="px"> <span class="p"> pic</span></span> </span> </span> <span class="js-only banish-unbanish no-mobile">[<a class="banish" title="hide" data-pid="5052050272">x</a><a class="unbanish linklike" title="unhide" data-pid="5052050272">undo</a>]</span> </span> </p>'
      rows = Nokogiri::HTML(rowsString).css(".row")
      expect(filter_links(rows, /puppy|pup|dog/i).length).to eql(1)
    end

    it "should return a match for a row with the word puppy" do
      # rowsString is contains one valid row
      row_text = 'Puppy!'
      rowsString =  '<p class="row" data-pid="5052050272"> <a href="/sfc/pet/5052050272.html" class="i" data-ids="0:00202_l0h95t4VvXv,0:00z0z_f3JUex3IvCA"></a> <span class="txt"> <span class="star"></span> <span class="pl"> <time datetime="2015-06-10 16:43" title="Wed 10 Jun 04:43:48 PM (-292 seconds ago)">Jun 10</time> <a href="/sfc/pet/5052050272.html" data-id="5052050272" class="hdrlnk">' + row_text + '</a> </span> <span class="l2"> <span class="pnr"> <small> (Rocket Dog Rescue)</small> <span class="px"> <span class="p"> pic</span></span> </span> </span> <span class="js-only banish-unbanish no-mobile">[<a class="banish" title="hide" data-pid="5052050272">x</a><a class="unbanish linklike" title="unhide" data-pid="5052050272">undo</a>]</span> </span> </p>'
      rows = Nokogiri::HTML(rowsString).css(".row")
      expect(filter_links(rows, /puppy|pup|dog/i).length).to eql(1)
    end

    it "should return a match for a row with the word pup" do
      # rowsString is contains one valid row
      row_text = 'Pup pup!'
      rowsString =  '<p class="row" data-pid="5052050272"> <a href="/sfc/pet/5052050272.html" class="i" data-ids="0:00202_l0h95t4VvXv,0:00z0z_f3JUex3IvCA"></a> <span class="txt"> <span class="star"></span> <span class="pl"> <time datetime="2015-06-10 16:43" title="Wed 10 Jun 04:43:48 PM (-292 seconds ago)">Jun 10</time> <a href="/sfc/pet/5052050272.html" data-id="5052050272" class="hdrlnk">' + row_text + '</a> </span> <span class="l2"> <span class="pnr"> <small> (Rocket Dog Rescue)</small> <span class="px"> <span class="p"> pic</span></span> </span> </span> <span class="js-only banish-unbanish no-mobile">[<a class="banish" title="hide" data-pid="5052050272">x</a><a class="unbanish linklike" title="unhide" data-pid="5052050272">undo</a>]</span> </span> </p>'
      rows = Nokogiri::HTML(rowsString).css(".row")
      expect(filter_links(rows, /puppy|pup|dog/i).length).to eql(1)
    end

  end

end