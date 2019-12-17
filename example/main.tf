provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
} 

module "cloudwatch_monitoring" {
  source = "../"
  appenv                     = "test"
  cloudwatch_log_group       = "grace-cloudtrail" //Not built by this module
  sns_topic_alarms           = "odp-monitoring-alarms"
  sns_topic_events           = "odp-monitoring-events"
}