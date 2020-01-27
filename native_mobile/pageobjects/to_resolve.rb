class Android_Onboarding_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def next_button
    @driver.find_element(:id => "com.sohohouse.seven:id/title_card_next_button")
  end

  def next_button_1
    @driver.find_element(:id => "com.sohohouse.seven:id/continue_button")
  end

  def makepersonal_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Make it personal']")
  end

  def intronotice_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Introducing Noticeboard']")
  end

  def intronotice_continue
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def continue_button
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def continue_button_to_notify_pref
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def noticeboard_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Noticeboard']")
  end

  def notification_pref_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Notification preferences']")
  end

  def ok_button
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'OK']")
  end

  def you_are_set_text
    @driver.find_element(:id => "com.sohohouse.seven:id/title_card_title")
  end

end
