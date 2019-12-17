{
  "Version": "2012-10-17",
  "Id": "CloudWatch_SNS_Policy",
  "Statement": [
    {
      "Sid": "CloudWatch_Alarm_Access",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "sns:GetTopicAttributes",
        "sns:SetTopicAttributes",
        "sns:AddPermission",
        "sns:RemovePermission",
        "sns:DeleteTopic",
        "sns:Subscribe",
        "sns:ListSubscriptionsByTopic",
        "sns:Publish",
        "sns:Receive"
      ],
      "Resource": "${var.sns_arn}",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "${data.aws_caller_identity.current_user.account_id}"
        }
      }
    },
    {
      "Sid": "AWS_Events_Access",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sns:Publish",
      "Resource": "arn:aws:sns:${var.region}:${data.aws_caller_identity.current_user.account_id}:${var.sns_topic_alarms}"
    }
  ]
}