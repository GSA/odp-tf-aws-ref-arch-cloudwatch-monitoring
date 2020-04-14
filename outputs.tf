output "cloudwatch_alarms_sns_arn" {
  value       = aws_sns_topic.sns_topic_alarms.arn
  description = "The arn of the created SNS Topic for CloudWatch Alarms and Events"
}

