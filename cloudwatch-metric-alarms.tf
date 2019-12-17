resource "aws_cloudwatch_metric_alarm" "root_usage" {
  alarm_name          = "RootUsage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.root_usage.id
  namespace           = var.alarm_namespace
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = var.treat_missing_data
  alarm_description   = "Monitoring for root account logins will provide visibility into the use of a fully privileged account and an opportunity to reduce the use of it."
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
}

resource "aws_cloudwatch_metric_alarm" "console_signin_failures" {
  alarm_name          = "ConsoleSigninFailures"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.console_signin_failures.id
  namespace           = var.alarm_namespace
  period              = "300"
  statistic           = "Sum"
  threshold           = "5"
  treat_missing_data  = var.treat_missing_data
  alarm_description   = "Monitoring failed console logins may decrease lead time to detect an attempt to brute force a credential, which may provide an indicator, such as source IP, that can be used in other event correlation."
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
}

resource "aws_cloudwatch_metric_alarm" "disable_or_delete_cmk" {
  alarm_name          = "DisableOrDeleteCMK"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.disable_or_delete_cmk.id
  namespace           = var.alarm_namespace
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = var.treat_missing_data
  alarm_description   = "Monitoring failed console logins may decrease lead time to detect an attempt to brute force a credential, which may provide an indicator, such as source IP, that can be used in other event correlation."
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
}

resource "aws_cloudwatch_metric_alarm" "console_sign_in_without_mfa" {
  alarm_name          = "ConsoleSignInWithoutMfa"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.console_sign_in_without_mfa.id
  namespace           = var.alarm_namespace
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = var.treat_missing_data
  alarm_description   = "Monitoring for console logins without MFA will provide visibility into all console logins that do not utilize MFA."
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
}

resource "aws_cloudwatch_metric_alarm" "S3BucketActivity" {
  alarm_name          = "CloudTrailS3BucketActivity"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "S3BucketActivityEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to S3 to put or delete a Bucket, Bucket Policy or Bucket ACL."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailSecurityGroupChanges" {
  alarm_name          = "CloudTrailSecurityGroupChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "SecurityGroupEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to create, update or delete a Security Group."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailNetworkAclChanges" {
  alarm_name          = "CloudTrailNetworkAclChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "NetworkAclEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to create, update or delete a Network ACL."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailGatewayChanges" {
  alarm_name          = "CloudTrailGatewayChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "GatewayEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to create, update or delete a Customer or Internet Gateway."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailVpcChanges" {
  alarm_name          = "CloudTrailVpcChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "VpcEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to create, update or delete a VPC, VPC peering connection or VPC connection to classic."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailEC2InstanceChanges" {
  alarm_name          = "CloudTrailEC2InstanceChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EC2InstanceEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot an EC2 instance."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailEC2LargeInstanceChanges" {
  alarm_name          = "CloudTrailEC2LargeInstanceChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EC2LargeInstanceEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot a 4x or 8x-large EC2 instance."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailChanges" {
  alarm_name          = "CloudTrailChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CloudTrailEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to create, update or delete a .cloudtrail. trail, or to start or stop logging to a trail."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailConsoleSignInFailures" {
  alarm_name          = "CloudTrailConsoleSignInFailures"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ConsoleSignInFailureCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "3"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an unauthenticated API call is made to sign into the console."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailAuthorizationFailures" {
  alarm_name          = "CloudTrailAuthorizationFailures"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "AuthorizationFailureCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an unauthorized API call is made."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailIAMPolicyChanges" {
  alarm_name          = "CloudTrailIAMPolicyChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "IAMPolicyEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.sns_topic_alarms.arn]
  alarm_description   = "Alarms when an API call is made to change an IAM policy."
}

