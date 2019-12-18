resource "aws_sns_topic" "sns_topic_alarms" {
  name = var.sns_topic_alarms
  //Add Encryption
}

resource "aws_sns_topic" "sns_topic_events" {
  name = var.sns_topic_events
  //Add Encryption
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