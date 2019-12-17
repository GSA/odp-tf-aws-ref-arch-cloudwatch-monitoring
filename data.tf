data "aws_caller_identity" "current_user" {
}

data "template_file" "sns_topic_alarms_policy" {
  template = file(
    "../policies/templates/sns.json.tpl",
  )
  vars = {
    sns_arn = aws_sns_topic.sns_topic_alarms.arn
  }
}

data "template_file" "sns_topic_events_policy" {
  template = file(
    "../policies/templates/sns.json.tpl",
  )
  vars = {
    sns_arn = aws_sns_topic.sns_topic_events.arn
  }
}

