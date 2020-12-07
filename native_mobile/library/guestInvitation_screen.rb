
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/onboarding_objects'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../pageobjects/guestInvitation_objects'
require_relative '../../common/functions_common'

class GuestInvitationScreen

  def initialize()

    if $device == "ios"


      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects=Ios_GuestInvitation_Objects.new($driver, $driver_appium)

    else

      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects = Android_GuestInvitation_Objects.new($driver, $driver_appium)

    end

  end


  def new_guest_invitation(arg)

    if Common.wait_for(20) {@device_guestinvitation_objects.new_invitation}.displayed?

      Common.wait_for(20){@device_guestinvitation_objects.select_location}.click

      Common.wait_for(2){@device_guestinvitation_objects.select_house}.click

      @device_guestinvitation_objects.confirm_selection.click

      Common.wait_for(2){@device_account_objects.ElementsWithText("Select a date")}.click

      str=@device_guestinvitation_objects.today_date.text

      (arg.include?"this week")?(date= str.split(" ")[2].to_i+2):(date= str.split(" ")[2].to_i+9)

      if date > 28

        date=date-28

        @device_guestinvitation_objects.next.click

      end

      @device_guestinvitation_objects.select_date(date.to_s).click

      @device_account_objects.ok_button.click

      $scenario.setContext(arg,$house+" "+Common.wait_for(2){@device_guestinvitation_objects.select_date_field}.text)

      @device_guestinvitation_objects.save_continue.click

      if Common.wait_for(5){@device_guestinvitation_objects.add_a_guest}.displayed?

        return true

      end

    end

    return false

  end

  def add_guest

    Common.wait_for(5){@device_guestinvitation_objects.add_a_guest}.click

    if Common.wait_for(2){@device_guestinvitation_objects.add_guest}.displayed?

      @device_guestinvitation_objects.enter_guest_name.send_keys("Test")

      @device_guestinvitation_objects.done.click

      if @device_account_objects.ElementsWithText("Test").displayed?

        @device_guestinvitation_objects.done.click

        return true
      end

    end

    return false

  end

  def confirm_invitation(date)

    sleep 1

    if Common.wait_for(20) {@device_account_objects.your_guest_invitation.displayed?}

      @device_account_objects.your_guest_invitation.click

      begin
        sleep 1

        if Common.wait_for(20) {@device_account_objects.ElementsWithText($scenario.getContext(date)).displayed?}

          Common.navigateBack

          return true

        end
      rescue

        Common.navigateBack

        return false

      end

    end
    return false
  end

  def deleteInvitation
    date=["this","future"," "]

    begin

      i=0

      while @device_guestinvitation_objects.ElementListWithText($house).size >0 do

        dt=((date.size>i)?date[i]:"dummy")+" week"

        $scenario.setContext(dt,@device_guestinvitation_objects.ElementListWithText($house)[0].text)

        @device_guestinvitation_objects.ElementListWithText($house)[0].click

        Common.wait_for(5){@device_guestinvitation_objects.ButtonWithText("Delete invite")}.click

        Common.wait_for(5){@device_guestinvitation_objects.confirm_selection}.click

        i=i+1

        sleep 1

      end

      Common.navigateBack

      return true

      rescue

    return false
    end
  end

end