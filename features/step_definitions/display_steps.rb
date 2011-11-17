When /^I go to the detail page for #{capture_model}$/ do |mod|
  visit polymorphic_path(model(mod))
end

Then /^I should see the heading "([^"]*)"$/ do |heading|
  find("h1, h2, h3").should have_content(heading)
end

Then /^I should see the description "([^"]*)"$/ do |description|
  page.all('.description, section, article, dd').should have_content description
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content content
end

When /^I go to the index page for #{capture_plural_factory}$/ do |mod|
  visit polymorphic_path mod
end

Then /^I should see the following in the index list$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end