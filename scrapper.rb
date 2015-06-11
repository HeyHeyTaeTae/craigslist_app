# scrapper.rb
require 'nokogiri'
require 'open-uri'



def filter_links(rows, regex)
  # takes in rows just those 
  # that have "pup", "puppy", or "dog"
  # keywords, assuming regex
  # is param that matches for 
  # such things
end

def get_todays_rows(doc, date_str)
  #  1.) open chrome console to look in inside p.row to see
  #  if there is some internal date related content, hint:
  #   there is `<time></time>` tag

  #  2.) figure out the class that you'll need to select the
  #   date from a row

end

def get_page_results
  url = "http://sfbay.craigslist.org/sfc/pet/"
  Nokogiri::HTML(open(url))
end

def search(date_str)
  # search should start by
  # getting the page
  get_page_results

  # then it should call the
  # other methods above
end

# want to learn more about 
# Time in ruby??
#   http://www.ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html#strftime-method
today = Time.now.strftime("%b %d")
search(today)