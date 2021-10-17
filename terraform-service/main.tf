provider "aws" {
  region = "eu-central-1"
}

module "lambda_sqs_sns" {
  source = "git@github.com:casasky/terraform-modules.git//lambda-sqs-sns"

  function_name     = "lambda-demo-module"
  filepath          = "${path.module}/../build/distributions/lambda-demo-module-in-java.zip"
  handler           = "com.casasky.Handler"
  runtime           = "java11"
  kms_master_key_id = module.kms_for_messages.kms_master_key_id
  sns_topic_arn     = module.sns.arn

  environment_variables = {
    LOG_LEVEL = "DEBUG"
  }

  tags = {
    Service = "java-lambda-demo"
  }
}

module "kms_for_messages" {
  source = "git@github.com:casasky/terraform-modules.git//kms"

  description = "KMS used for encrypting all messages"
  alias       = "messages"
}

module "sns" {
  source = "git@github.com:casasky/terraform-modules.git//sns"

  name              = "java-sns-demo"
  kms_master_key_id = module.kms_for_messages.kms_master_key_id

  tags = {
    Name = "java-sns-demo"
  }
}

