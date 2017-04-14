require "aws-sdk"

s3 = Aws::S3::Resource.new(region: ENV["AWS_DEFAULT_REGION"])

iosDistribution = s3.bucket(ENV["AWS_BUCKET"]).object("vantan.llc.ios.distribution.p12.enc")
iosDistribution.get(response_target: "./vantan.llc.ios.distribution.p12.enc")

