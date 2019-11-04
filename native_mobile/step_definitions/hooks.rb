require 'rubygems'
require 'cucumber'
require 'report_builder'
#
at_exit do
  ReportBuilder.configure do |config|
  config.json_path = 'results/cucumber_json'
  config.report_path = 'results/reports/Test_Exec_Report'
  config.report_types = [:html]
  config.report_tabs = [:overview, :features, :scenarios, :errors]
  config.report_title = 'My Test Results'
  config.compress_images = false
end
ReportBuilder.build_report
end

After do |scenario|
  if scenario.failed?

    encoded_img = $driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
  end
end