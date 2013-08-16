Given /^"([^"]*)" is a user with email id "([^"]*)" and password "([^"]*)"$/ do |full_name, email, password|
  first_name, last_name = full_name.split
  @user = User.create(email: email, password: password, password_confirmation: password, first_name: first_name.to_s, last_name: last_name.to_s, role: 'user')
end

And /^his authentication token is "([^"]*)"$/ do |auth_token|
  @user.authentication_token = auth_token
  @user.save!
end

And /^his role is "([^"]*)"$/ do |role|
  @user.role = role
  @user.save!
end


And /^the auth_token should be different from "([^"]*)"$/ do |auth_token|
  @user.reload
  @user.authentication_token.should_not == auth_token
end

And /^the auth_token should still be "([^"]*)"$/ do |auth_token|
  @user.reload
  @user.authentication_token.should == auth_token
end

Then /^the user with email "([^"]*)" should have "([^"]*)" as his authentication_token$/ do |email, token|
  JsonSpec.remember(token).should == User.where(email: email).first.authentication_token.to_json
end

And /^his password should be "([^"]*)"$/ do |password|
  @user.reload
  @user.valid_password?(password).should be_true
end

Then(/^a user should be present with the following$/) do |table|
  User.where(table.rows_hash).present?.should be_true
end

Given "the following user exists" do |table|
  User.create!(table.rows_hash)
end

Then(/^there should not be any user with email "(.*?)"$/) do |email|
  User.where(email: email).first.should be_nil
end

Given "the following users exist" do |user_data|
  user_hashes = user_data.hashes
  user_hashes.each do |user_hash|
    user_hash["password_confirmation"] = user_hash["password"]
    User.create!(user_hash)
  end
  User.count.should == user_hashes.size
end
