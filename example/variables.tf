variable "appenv" {
  type    = string
  default = "development"
}

variable "sns_topic_alarms" {
  type        = string
  description = "The friendly name for the SNS topic to be created"
}


variable "cloudwatch_log_group" {
  type        = string
  description = "The name of the cloudwatch log group being utilized by cloudtrail"
}

variable "alarm_namespace" {
  description = "The namespace in which all alarms are set up."
  default     = "CloudWatchAlarms"
}

variable "treat_missing_data" {
  description = "value used by all aws_cloudwatch_metric_alarm for the treat_missing_data property"
  default     = "ignore"
}

