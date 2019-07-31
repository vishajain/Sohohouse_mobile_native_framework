module Appium_Helpers

    # Below definition starts the Appium server @ port 4723
    # Exit the program if fails

    def Appium_Helpers.start_appium()

      begin

        $Appium_pid = spawn 'appium --address 0.0.0.0 --port 4723'

        Process.detach($Appium_pid)

        sleep(10)

      rescue

        puts "!!!!! Unable to start Appium server"

        Process.exit

      end

    end


  # Below definition starts the Appium server @ port 4723
  # Exit the program if fails

  def Appium_Helpers.kill_appium()

    begin

      sleep(10)

      Process.kill("HUP",$Appium_pid)

      puts "!!!!! Appium PID we're going to kill is #{$Appium_pid}"

    rescue

      puts "!!!!! Unable to kill Appium server"

      Process.exit

    end

  end

end