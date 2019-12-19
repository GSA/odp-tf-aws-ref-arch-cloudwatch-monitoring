variable "appenv" {
  type    = string
  default = "development"
}

variable "sns_topic_alarms" {
  type        = string
  description = "The friendly name for the SNS topic to be created"
}

variable "sns_topic_events" {
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

variable "deletion_window" {
  description = "value of how many days the key exsists after resource deletion"
  default     = "30"
}

variable "is_enabled" {
  type        = bool
  description = "used for enabling/disabling of kms keys"
  default     = "true"
}

variable "is_key_rotation_enabled" {
  type        = bool
  description = "used for enabling/disabling of automatic kms key rotation"
  default     = "true"
}

variable "kms_alarm_alias" {
  type        = string
  description = "alias name for alarms kms key"
  default     = "alias/cloudwatch_monitoring_alarms_key"
}

variable "kms_event_alias" {
  type        = string
  description = "alias name for events kms key"
  default     = "alias/cloudwatch_monitoring_events_key"
}



