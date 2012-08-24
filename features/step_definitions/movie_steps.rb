# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |unchk, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split.each do |rating|
    if unchk
      uncheck("ratings[#{rating}]")
    else
      check("ratings[#{rating}]")
    end
  end
end

Then /I should see all of the movies/ do
  page.body.scan(/More about/).count.should == 10
end

Then /I should see none of the movies/ do
  page.body.scan(/More about/).count.should == 0
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.  
  index1 = page.body.index(e1)
  index2 = page.body.index(e2)
  if index1 == nil or index2 == nil
    false.should == true
  else
    index1.should < index2
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  #Then I should see "Alien" before "Ridley Scott"
  page.body.include?(title).should be true
  page.body.include?(director).should be true
  #Movie.where(:title => title).first.director.should be director
end