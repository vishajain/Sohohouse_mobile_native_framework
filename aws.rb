# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
require 'aws-sdk-s3'
require 'dotenv'

def object_uploaded?(s3_client, bucket_name, object_key,device)

  response = s3_client.put_object(
    bucket: bucket_name,
    key: object_key,
    body: IO.read("results/reports/"+device+"_Test_Exec_Report.html")
  )
  if response.etag
    return true
  else
    return false
  end
rescue StandardError => e
  puts "Error uploading object: #{e.message}"
  return false
end

# Full example call:
def run_me(device)
  Dotenv.load('.env')
  Aws.config.update({ credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])})
  (device.downcase)==="android"?text="Android":text="IOS"
  bucket_name = ENV['AWS_BUCKET']
  object_key = text+'_Test_Exec_Report.html'
  region = ENV['AWS_REGION']
  s3_client = Aws::S3::Client.new(region: region)
  if object_uploaded?(s3_client, bucket_name, object_key,text)
    puts "Object '#{object_key}' uploaded to bucket '#{bucket_name}'."
  else
    puts "Object '#{object_key}' not uploaded to bucket '#{bucket_name}'."
  end
end

run_me(ARGV[0])