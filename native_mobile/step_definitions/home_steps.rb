
require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../pageobjects/home_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

Then("greetings should be visible") do

  sleep 5

  begin

    assert_true($homescreen.verify_greetings,"Greetings not present")

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end

end

Then("username should be visible") do

  begin

    assert_true($homescreen.verify_username,"Username is not present")

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end

end

Then("happening now should be visible") do

  begin

    assert_true($homescreen.verify_happening_now,"Happening now section is not present")

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end

end

Then("house notes should be visible") do

  begin

    assert_true($homescreen.verify_house_notes,"House Notes section is not present")

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end

end

Then("see all stories should be visible") do

  begin

    assert_true($homescreen.verify_see_all_stories,"See all stories section is not present")

  rescue => e

    Common.scenario_failed_and_noquit

  end

end

Then("noticeboard section is visible") do

  begin

    assert_true($homescreen.verify_noticeboard,"Noticeboard section is not present")

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end


end


Then("house perks link should be visible") do

  begin

    assert_true($homescreen.verify_house_perks,"House perks link is not present")

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end


end

Then("browse the houses link should be visible") do

  begin

    assert_true($homescreen.verify_browse_houses,"Browse house links is not present")

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end

end


Then (/^(.*) button should be visible/) do |footer_button|

  begin

    assert_true($homescreen.verify_footer_buttons(footer_button),  ""+footer_button+"" +  "is not present" )

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end


  end


