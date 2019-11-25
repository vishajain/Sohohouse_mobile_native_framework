require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/account_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../pageobjects/editprofile_objects'
require_relative '../library/editprofile_screen'
require_relative '../../common/functions_common'

include Test::Unit::Assertions


Given("user clicks on Account button on home screen") do

  $homescreen.verify_account_click

  $accountscreen = AccountScreen.new

end

When("user taps on View Profile link") do

  $accountscreen.tap_View_Profile


end

When("user taps on Edit link") do

  $accountscreen.tap_edit_link

end

Then("user sees the Edit profile screen") do

  $editprofilescreen = EditProfileScreen.new

  assert_true($editprofilescreen.verify_edit_profile_screen_title,"Unable to land on Edit profile screen")

end

When(/^user provides profession value$/) do

  $editprofilescreen.user_enters_profession_value

end

When(/^user provides industry value$/) do

  $editprofilescreen.user_enters_industry_value

end

When(/^user provides city value$/) do

  $editprofilescreen.user_enters_city_value

end

When(/^user provides about me value$/) do

  $editprofilescreen.user_enters_about_me_value

end

When(/^user provides lets chat value$/) do

  $editprofilescreen.user_enters_lets_chat_value

end


When(/^user provides interests value$/) do

  $editprofilescreen.user_enters_interests_value

end

When(/^user provides website value$/) do

  $editprofilescreen.user_enters_website_value
end

When(/^user provides instagram value$/) do

  $editprofilescreen.user_enters_instagram_value

end

When(/^user provides twitter value$/) do

  $editprofilescreen.user_enters_twitter_value

end

When(/^user provides linkedin value$/) do

  $editprofilescreen.user_enters_linkedin_value

end


When(/^user provides spotify value$/) do

  $editprofilescreen.user_enters_spotify_value

end


When(/^user provides youtube value$/) do

  $editprofilescreen.user_enters_youtube_value

end

When(/^user taps on Done$/) do

  $editprofilescreen.user_taps_done

end

And(/^user taps on save changes$/) do

  $editprofilescreen.user_save_changes

end

Then(/^profession value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_profession_value,"Profession value is not saved ")

end

Then(/^industry value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_industry_value,"Industry value is not saved")

end

Then(/^city value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_city_value,"City value is not saved ")

end

Then(/^about me value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_about_me_value,"About me value on is not saved ")

end

Then(/^lets chat value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_lets_chat_value,"Lets chat value is not saved ")

end

Then(/^website value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_website,"Website is not saved ")

end

Then(/^instagram value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_instagram,"Instagram is not saved ")

end

Then(/^twitter value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_twitter,"Twitter is not saved ")

end

Then(/^linkedin value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_linkedin,"Linkedin is not saved ")

end

Then(/^spotify value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_spotify,"Spotify is not saved ")

end

Then(/^youtube value is shown on view profile screen$/) do

  assert_true($editprofilescreen.verify_youtube,"Youtube is not saved ")

end