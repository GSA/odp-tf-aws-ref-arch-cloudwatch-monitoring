resource "aws_kms_key" "kms_sns_topic_alarms" {
  description             = "KMS key for Cloudwatch_Monitoring SNS Alarm Topic"
  deletion_window_in_days = var.deletion_window
  is_enabled              = var.is_enabled
  enable_key_rotation     = var.is_key_rotation_enabled
  policy = templatefile("${path.module}/policies/templates/cloudwatch_kms.json.tpl",{
    account_owner = data.aws_caller_identity.current_user.account_id
  })
}

resource "aws_kms_alias" "kms_sns_topic_alarms" {
  name          = var.kms_alarm_alias
  target_key_id = aws_kms_key.kms_sns_topic_alarms.key_id
}

resource "aws_kms_key" "kms_sns_topic_events" {
  description             = "KMS key for Cloudwatch_Monitoring SNS Event Topic"
  deletion_window_in_days = var.deletion_window
  is_enabled              = var.is_enabled
  enable_key_rotation     = var.is_key_rotation_enabled
  policy = templatefile("${path.module}/policies/templates/cloudwatch_kms.json.tpl",{
    account_owner = data.aws_caller_identity.current_user.account_id
  })
}

resource "aws_kms_alias" "kms_sns_topic_events" {
  name          = var.kms_event_alias
  target_key_id = aws_kms_key.kms_sns_topic_events.key_id
}

resource "aws_sns_topic" "sns_topic_alarms" {
  name = var.sns_topic_alarms
  kms_master_key_id = aws_kms_key.kms_sns_topic_alarms.key_id
}

resource "aws_sns_topic" "sns_topic_events" {
  name = var.sns_topic_events
  kms_master_key_id = aws_kms_key.kms_sns_topic_events.key_id
}

resource "aws_sns_topic_policy" "sns_policy_alarms" {
  arn = aws_sns_topic.sns_topic_alarms.arn

  policy = templatefile("${path.module}/policies/templates/sns.json.tpl",{
    sns_arn = aws_sns_topic.sns_topic_alarms.arn
    account_owner = data.aws_caller_identity.current_user.account_id
  })
}

resource "aws_sns_topic_policy" "sns_policy_events" {
  arn = aws_sns_topic.sns_topic_events.arn

  policy = templatefile("${path.module}/policies/templates/sns.json.tpl",{
    sns_arn = aws_sns_topic.sns_topic_events.arn
    account_owner = data.aws_caller_identity.current_user.account_id
  })
}