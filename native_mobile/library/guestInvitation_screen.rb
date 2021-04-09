
require 'rubygems'
require 'appium_lib'
require 'date'
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

    month=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

    if Common.wait_for(20) {@device_guestinvitation_objects.new_invitation}.displayed?

      sleep 2

      Common.wait_for(20){@device_guestinvitation_objects.select_location}.click

      $common_screen.click_element_with_partial_text("Europe")

      Common.wait_for(2){@device_guestinvitation_objects.select_house}.click

      @device_guestinvitation_objects.confirm_selection.click

      $device == "ios"?(text="Select date"):(text="Select a date")

      Common.wait_for(2){@device_account_objects.ElementsWithText(text)}.click

      $device == "ios"?(str=@device_guestinvitation_objects.today_date.value):(str=@device_guestinvitation_objects.today_date.text)

      if $device == "ios"

        str=Date.new(str.split(" ")[3].to_i,month.index(str.split(" ")[2])+1,str.split(" ")[1].to_i)

        (arg.include?"this week")?(str= str+2):(str= str+9)

        str=Date::DAYNAMES[str.wday][0,3]+" "+str.strftime("%d %b %Y").to_s

        @device_guestinvitation_objects.today_date.send_keys(str)

        Common.wait_for(2){@device_account_objects.ElementsWithText("Confirm selection")}.click

      else

        (arg.include?"this week")?(date= str.split(" ")[2].to_i+2):(date= str.split(" ")[2].to_i+9)

        if date > 28

          date=date-28

          @device_guestinvitation_objects.next.click

        end

        @device_guestinvitation_objects.select_date(date.to_s).click

        @device_account_objects.ok_close_button.click
      end

      $device == "ios"?str=" ":(str=@device_guestinvitation_objects.select_date_field.text)

      $scenario.setContext(arg,("Little Beach House Barcelona"+" "+str).strip)

      @device_guestinvitation_objects.save_continue.click

      sleep 2

      if Common.wait_for(5){@device_guestinvitation_objects.add_a_guest}.displayed?

        return true

      end

    end

    return false

  end

  def add_guest

    Common.wait_for(5){@device_guestinvitation_objects.add_a_guest}.click

    if Common.wait_for(2){@device_guestinvitation_objects.add_guest}.displayed?

      $device == "ios"? (@device_guestinvitation_objects.enter_guest_name.click):(sleep 1)

      @device_guestinvitation_objects.enter_guest_name.send_keys("Test")

      $device == "ios"?(@device_guestinvitation_objects.save_continue.click):(@device_guestinvitation_objects.done.click)

      if @device_account_objects.ElementsWithText("Test").displayed?

        @device_guestinvitation_objects.done.click

        sleep 3

        return true
      end

    end

    return false

  end

  def confirm_invitation(date)

    sleep 1

      begin

        sleep 1

        if Common.wait_for(20) {@device_account_objects.ElementsWithText($scenario.getContext(date)).displayed?}

          return true

        end

      rescue

        return false

      end

  end

  def deleteInvitation
    date=["this","future"," "]

    begin

      i=0

      while @device_guestinvitation_objects.ElementListWithText("Little Beach House Barcelona").size >0 do

        dt=((date.size>i)?date[i]:"dummy")+" week"

        $scenario.setContext(dt,@device_guestinvitation_objects.ElementListWithText("Little Beach House Barcelona")[0].text)

        @device_guestinvitation_objects.ElementListWithText("Little Beach House Barcelona")[0].click

        $device == "ios"? text="Delete invitation":text="Delete invite"

        Common.wait_for(5){@device_guestinvitation_objects.ButtonWithText(text)}.click

        $device == "ios"?(sleep 1):(Common.wait_for(5){@device_guestinvitation_objects.confirm_selection}.click)

        i=i+1

        sleep 3

      end

      $accountscreen.navigate_back_to_account

      return true

      rescue StandardError => msg
        print msg.message

    return false
    end
  end

end