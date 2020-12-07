require 'rubygems'
require 'cucumber'
require 'report_builder'
#
at_exit do
  if $device == "ios"
    ReportBuilder.configure do |config|
    config.json_path = 'results/cucumber_json/ios'
    config.report_path = 'results/reports/iOS_Test_Exec_Report'
    config.report_types = [:html]
    config.report_tabs = [:overview, :features, :scenarios, :errors]
    config.report_title = 'My Test Results'
    config.compress_images = false
    end
  else
    ReportBuilder.configure do |config|
      config.json_path = 'results/cucumber_json/android'
      config.report_path = 'results/reports/Android_Test_Exec_Report'
      config.report_types = [:html]
      config.report_tabs = [:overview, :features, :scenarios, :errors]
      config.report_title = 'My Test Results'
      config.compress_images = false
    end
  end
  ReportBuilder.build_report
end

Before do |scenario|

  $scenario=ScenarioContext.new
  $scenario.setContext("scenario",scenario.name)

end

After do |scenario|
  if scenario.failed?

    encoded_img = $driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
  end
end