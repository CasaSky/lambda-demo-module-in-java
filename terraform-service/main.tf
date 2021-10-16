provider "aws" {
  region = "eu-central-1"
}

module "lambda_sqs" {
  source = "git@github.com:casasky/terraform_modules.git//lambda-sqs"
  function_name = "lambda_module"
  filepath = "${path.module}/../build/distributions/lambda-demo-module-in-java.zip"
  handler = "com.casasky.Handler"
  runtime = "java11"
}