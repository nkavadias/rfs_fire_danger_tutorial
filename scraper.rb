# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'
#
agent = Mechanize.new
#
#puts "hello world"
# # Read in a page
page = agent.get("http://www.rfs.nsw.gov.au/fire-information/fdr-and-tobans")
#
# # Find somehing on the page using css selectors
 #p page.at(".danger-ratings-table").search("tr").first
page.at(".danger-ratings-table tbody").search("tr").each do | row |
  area 	              = row.search("td")[0].text
  today_danger         = row.search("td")[1].text
  today_ban        	  = row.search("td")[2].text
  tomorrow_danger      = row.search("td")[3].text
  tomorrow_ban         = row.search("td")[4].text
  councils_affected    = row.search("td")[5].text
  puts  area +" "+ " " +today_danger + " "+ today_ban +" " + tomorrow_ban + " " + councils_affected
end
# # Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite( ["name"], {"name" => "susan", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".
