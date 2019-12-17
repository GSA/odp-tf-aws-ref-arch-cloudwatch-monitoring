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

  policy = data.template_file.sns_topic_alarms_policy.rendered
}

resource "aws_sns_topic_policy" "sns_policy_events" {
  arn = aws_sns_topic.sns_topic_events.arn

  policy = data.template_file.sns_topic_events_policy.rendered
}

