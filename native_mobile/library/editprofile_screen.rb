
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../pageobjects/editprofile_objects'
require_relative '../pageobjects/viewprofile_objects'
require_relative '../../common/functions_common'

class EditProfileScreen

  def initialize()

    if $device == "ios"
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)
      @device_editprofile_objects = Ios_Editprofile_Objects.new($driver, $driver_appium)
      @device_viewprofile_objects = Ios_Viewprofile_Objects.new($driver, $driver_appium)
    else
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
      @device_editprofile_objects = Android_Editprofile_Objects.new($driver, $driver_appium)
      @device_viewprofile_objects = Android_Viewprofile_Objects.new($driver, $driver_appium)
    end

  end

  def verify_edit_profile_screen_title

    if Common.wait_for(10) {@device_editprofile_objects.edit_profile}.displayed?

      return true

    end

  end

  def user_enters_profession_value

    if Common.wait_for(10){@device_editprofile_objects.profession_input}.text.include? "software"
      profile = "profile2"
    else
      profile = 'profile1'
    end

    config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

    $profession_value = config[:props]["data"]["profile"][profile]["profession"]
    $industry_value = config[:props]["data"]["profile"][profile]["industry"]
    $city_value = config[:props]["data"]["profile"][profile]["city"]
    $about_me_value =  config[:props]["data"]["profile"][profile]["about-me"]
    $chat_value =  config[:props]["data"]["profile"][profile]["chat"]
    $interest1_value = config[:props]["data"]["profile"][profile]["interest1"]
    $interest2_value = config[:props]["data"]["profile"][profile]["interest2"]
    $website_value = config[:props]["data"]["profile"][profile]["website"]
    $instagram_value = config[:props]["data"]["profile"][profile]["instagram"]
    $twitter_value = config[:props]["data"]["profile"][profile]["twitter"]
    $linkedin_value = config[:props]["data"]["profile"][profile]["linkedin"]
    $spotify_value = config[:props]["data"]["profile"][profile]["spotify"]
    $youtube_value = config[:props]["data"]["profile"][profile]["youtube"]

    Common.wait_for(10){@device_editprofile_objects.profession}.click

    Common.wait_for(10){@device_editprofile_objects.text_input}.clear

    if $device == "ios"
      @device_editprofile_objects.profession.send_keys($profession_value)
    else
      @device_editprofile_objects.text_input.send_keys($profession_value)
    end

    $driver.action.move_to(@device_editprofile_objects.done).click.perform

  end

  def user_enters_industry_value

    Common.wait_for(10){@device_editprofile_objects.industry}.click

    if $device == "ios"
      @device_editprofile_objects.industry_input.send_keys($industry_value)
      Common.wait_for(10){@device_editprofile_objects.industry}.click
    else
      @device_editprofile_objects.industry_input.replace_value($industry_value)
      @device_editprofile_objects.industry_input.click
      @device_editprofile_objects.industry.click
    end



  end

  def user_enters_city_value

    Common.wait_for(10){@device_editprofile_objects.city}.click

    Common.wait_for(10){@device_editprofile_objects.text_input}.clear

    @device_editprofile_objects.city.send_keys($city_value)

    $driver.action.move_to(@device_editprofile_objects.done).click.perform

  end

  def user_enters_about_me_value

    sleep 1

    Common.little_swipe_down

    Common.wait_for(10){@device_editprofile_objects.aboutme}.click

    Common.wait_for(10){@device_editprofile_objects.large_text_input}.clear

    if $device == "ios"
      @device_editprofile_objects.aboutme.send_keys($about_me_value)
    else
      @device_editprofile_objects.large_text_input.send_keys($about_me_value)
    end

    $driver.action.move_to(@device_editprofile_objects.done).click.perform

  end

  def user_enters_lets_chat_value

    Common.little_swipe_down

    Common.wait_for(10){@device_editprofile_objects.chat}.click

    Common.wait_for(10){@device_editprofile_objects.large_text_input}.clear

    if $device == "ios"
      @device_editprofile_objects.chat.send_keys($chat_value)
    else
      @device_editprofile_objects.large_text_input.send_keys($chat_value)
    end

    $driver.action.move_to(@device_editprofile_objects.done).click.perform

  end

  def user_enters_interests_value

    Common.little_swipe_down

    Common.wait_for(10){@device_editprofile_objects.interests}.click

    element_count = Common.wait_for(10){@device_editprofile_objects.interests_remove.size}

    if element_count > 0

      until element_count == 0

        @device_editprofile_objects.interests_remove[0].click

        element_count = element_count-1

      end

    end

    if $device == "ios"
     @device_editprofile_objects.interests.send_keys("i")
    else
      @device_editprofile_objects.interests_input1.send_keys("i")
    end

    @device_editprofile_objects.interests_input($interest1_value).click

    @device_editprofile_objects.interests_input($interest2_value).click

    $driver.action.move_to(@device_editprofile_objects.done).click.perform

  end

  def user_enters_website_value

    Common.little_swipe_down

    Common.wait_for(10){@device_editprofile_objects.social_accounts}.click

    Common.wait_for(10){@device_editprofile_objects.website_text}.click

    Common.wait_for(10){@device_editprofile_objects.website_text}.clear

    if $device == "ios"

      @device_editprofile_objects.website.send_keys($website_value)

    else

      Common.wait_for(10){@device_editprofile_objects.website_text.send_keys($website_value)}

    end

  end

  def user_enters_instagram_value

    Common.wait_for(10){@device_editprofile_objects.instagram_text}.click

    Common.wait_for(10){@device_editprofile_objects.instagram_text}.clear

    @device_editprofile_objects.instagram_text.send_keys($instagram_value)


  end

  def user_enters_twitter_value

    Common.wait_for(10){@device_editprofile_objects.twitter_text}.click

    Common.wait_for(10){@device_editprofile_objects.twitter_text}.clear

    @device_editprofile_objects.twitter_text.send_keys($twitter_value)

    Common.little_swipe_down

  end

  def user_enters_linkedin_value

    Common.wait_for(10){@device_editprofile_objects.linkedin_text}.click

    Common.wait_for(10){@device_editprofile_objects.linkedin_text}.clear

    @device_editprofile_objects.linkedin_text.send_keys($linkedin_value)

  end

  def user_enters_spotify_value

    Common.wait_for(10){@device_editprofile_objects.spotify_text}.click

    Common.wait_for(10){@device_editprofile_objects.spotify_text}.clear

    @device_editprofile_objects.spotify_text.send_keys($spotify_value)

  end

  def user_enters_youtube_value

    Common.wait_for(10){@device_editprofile_objects.youtube_text}.click

    Common.wait_for(10){@device_editprofile_objects.youtube_text}.clear

    @device_editprofile_objects.youtube_text.send_keys($youtube_value)

  end

  def user_taps_done

    $driver.action.move_to(@device_editprofile_objects.done).click.perform

  end

  def user_save_changes

    Common.wait_for(10){@device_editprofile_objects.save_changes}.click

  end

  def verify_profession_value

    return Common.wait_for(20){@device_viewprofile_objects.profession_value1}.text.include? $profession_value

  end

  def verify_interests_values

    if Common.wait_for(20){@device_viewprofile_objects.interests_value}.text.include? $interest1_value

       if Common.wait_for(20){@device_viewprofile_objects.interests_value}.text.include? $interest2_value

           return true

       end

    end

  end

  def verify_industry_value

    return Common.wait_for(20){@device_viewprofile_objects.industry_value}.text.include? $industry_value

  end

  def verify_city_value

    return Common.wait_for(20){@device_viewprofile_objects.city_value}.text.include? $city_value

  end

  def verify_about_me_value

    return Common.wait_for(20){@device_viewprofile_objects.about_me_value}.text.include? $about_me_value

  end

  def verify_lets_chat_value

    return Common.wait_for(20){@device_viewprofile_objects.lets_chat_value}.text.include? $chat_value

  end

  def verify_website

    return Common.wait_for(20) {@device_viewprofile_objects.website_value}.displayed?

  end

  def verify_instagram

    return Common.wait_for(20) {@device_viewprofile_objects.instagram_value}.displayed?


  end

  def verify_twitter

    return Common.wait_for(20) {@device_viewprofile_objects.twitter_value}.displayed?

  end

  def verify_linkedin

    return Common.wait_for(20) {@device_viewprofile_objects.linkedin_value}.displayed?

  end

  def verify_spotify

    return Common.wait_for(20) {@device_viewprofile_objects.spotify_value}.displayed?

  end

  def verify_youtube

    return Common.wait_for(20) {@device_viewprofile_objects.youtube_value}.displayed?

  end

  def home_screen_navigate

    if $device == "ios"

      Common.wait_for(20){@device_viewprofile_objects.icon_left.click}

      Common.wait_for(20){@device_viewprofile_objects.homeBtn.click}

      return true

    else

      Common.wait_for(20){@device_viewprofile_objects.navigate_up.click}

      Common.wait_for(20){@device_viewprofile_objects.homeBtn.click}

      return true

    end

  end

end

