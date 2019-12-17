resource "aws_cloudwatch_event_target" "sns_s3" {
  rule      = aws_cloudwatch_event_rule.S3.name
  target_id = "CloudWatch-Event-S3"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"       = "$.detail.eventTime"
      "EventType"       = "$.detail-type"
      "UserID"          = "$.detail.userIdentity.arn"
      "AccountID"       = "$.detail.userIdentity.accountId"
      "SourceIP"        = "$.detail.sourceIPAddress"
      "UserAgent"       = "$.detail.userAgent"
      "EventSource"     = "$.detail.eventSource"
      "AWSRegion"       = "$.detail.awsRegion"
      "EventName"       = "$.detail.eventName"
      "EventParameters" = "$.detail.requestParameters[*]"
    }

    input_template = <<INPUT_TEMPLATE_EOF
    {
       "Event Time": <EventTime>,
       "Event Type":<EventType>,
       "User ID": <UserID>,
       "Account ID": <AccountID>,
       "Source IP": <SourceIP>,
       "User Agent": <UserAgent>,
       "Event Source": <EventSource>,
       "AWS Region": <AWSRegion>,
       "Event Name": <EventName>,
       "Event Parameters": <EventParameters>
}
    
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_awsconfig" {
  rule      = aws_cloudwatch_event_rule.awsconfig.name
  target_id = "CloudWatch-Event-awsconfig"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"           = "$.time"
      "EventType"           = "$.detail-type"
      "AWSRegion"           = "$.detail.awsRegion"
      "AWSAccount"          = "$.detail.awsAccountId"
      "ConfigRuleName"      = "$.detail.newEvaluationResult.evaluationResultIdentifier.evaluationResultQualifier.configRuleName"
      "ResourceType"        = "$.detail.newEvaluationResult.evaluationResultIdentifier.evaluationResultQualifier.resourceType"
      "ResourceID"          = "$.detail.newEvaluationResult.evaluationResultIdentifier.evaluationResultQualifier.resourceId"
      "NewComplianceStatus" = "$.detail.newEvaluationResult.complianceType"
      "OldComplianceStatus" = "$.detail.oldEvaluationResult.complianceType"
    }

    input_template = <<INPUT_TEMPLATE_EOF
  {
       "Event Time": <EventTime>,
       "Event Type":<EventType>,
       "AWS Region": <AWSRegion>,
       "AWS Account": <AWSAccount>,
       "Config Rule": <ConfigRuleName>,
       "Resource Type": <ResourceType>,
       "Resource ID": <ResourceID>,
       "New Compliance State": <NewComplianceStatus>,
       "Old Compliance State": <OldComplianceStatus>
}
    
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_ec2" {
  rule      = aws_cloudwatch_event_rule.ec2_changes.name
  target_id = "CloudWatch-Event-ec2-changes"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"       = "$.detail.eventTime"
      "EventType"       = "$.detail-type"
      "UserID"          = "$.detail.userIdentity.arn"
      "AccountID"       = "$.detail.userIdentity.accountId"
      "SourceIP"        = "$.detail.sourceIPAddress"
      "UserAgent"       = "$.detail.userAgent"
      "EventSource"     = "$.detail.eventSource"
      "AWSRegion"       = "$.detail.awsRegion"
      "EventName"       = "$.detail.eventName"
      "EventParameters" = "$.detail.requestParameters[*]"
    }

    input_template = <<INPUT_TEMPLATE_EOF
 {
       "Event Time": <EventTime>,
       "Event Type": <EventType>,
       "User ID": <UserID>,
       "Account ID": <AccountID>,
       "Source IP": <SourceIP>,
       "User Agent": <UserAgent>,
       "Event Source": <EventSource>,
       "AWS Region": <AWSRegion>,
       "Event Name": <EventName>,
       "Event Parameters": <EventParameters>
}
    
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_cloudtrail_configuration_changes" {
  rule      = aws_cloudwatch_event_rule.cloudtrail_configuration_changes.name
  target_id = "CloudWatch-Event-cloudtrail_configuration_changes"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"       = "$.detail.eventTime"
      "EventType"       = "$.detail-type"
      "UserID"          = "$.detail.userIdentity.arn"
      "SourceIP"        = "$.detail.sourceIPAddress"
      "UserAgent"       = "$.detail.userAgent"
      "EventSource"     = "$.detail.eventSource"
      "AWSRegion"       = "$.detail.awsRegion"
      "EventName"       = "$.detail.eventName"
      "EventParameters" = "$.detail.requestParameters[*]"
    }

    input_template = <<INPUT_TEMPLATE_EOF
 {
       "Event Time": <EventTime>,
       "Event Type":<EventType>,
       "User ID": <UserID>,
       "Source IP": <SourceIP>,
       "User Agent": <UserAgent>,
       "Event Source": <EventSource>,
       "AWS Region": <AWSRegion>,
       "Event Name": <EventName>,
       "Event Parameters": <EventParameters>
}
   
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_network_gateway_changes" {
  rule      = aws_cloudwatch_event_rule.network_gateway_changes.name
  target_id = "CloudWatch-Event-network_gateway_changes"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"       = "$.detail.eventTime"
      "EventType"       = "$.detail-type"
      "UserID"          = "$.detail.userIdentity.arn"
      "AccountID"       = "$.detail.userIdentity.accountId"
      "SourceIP"        = "$.detail.sourceIPAddress"
      "UserAgent"       = "$.detail.userAgent"
      "EventSource"     = "$.detail.eventSource"
      "AWSRegion"       = "$.detail.awsRegion"
      "EventName"       = "$.detail.eventName"
      "EventParameters" = "$.detail.requestParameters[*]"
    }

    input_template = <<INPUT_TEMPLATE_EOF
 {
       "Event Time": <EventTime>,
       "Event Type":<EventType>,
       "User ID": <UserID>,
       "Account ID": <AccountID>,
       "Source IP": <SourceIP>,
       "User Agent": <UserAgent>,
       "Event Source": <EventSource>,
       "AWS Region": <AWSRegion>,
       "Event Name": <EventName>,
       "Event Parameters": <EventParameters>
}

   
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_config_configuration_changes" {
  rule      = aws_cloudwatch_event_rule.config_configuration_changes.name
  target_id = "CloudWatch-Event-config_configuration_changes"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"       = "$.detail.eventTime"
      "EventType"       = "$.detail-type"
      "UserID"          = "$.detail.userIdentity.arn"
      "AccountID"       = "$.detail.userIdentity.accountId"
      "SourceIP"        = "$.detail.sourceIPAddress"
      "UserAgent"       = "$.detail.userAgent"
      "EventSource"     = "$.detail.eventSource"
      "AWSRegion"       = "$.detail.awsRegion"
      "EventName"       = "$.detail.eventName"
      "EventParameters" = "$.detail.requestParameters[*]"
    }

    input_template = <<INPUT_TEMPLATE_EOF

   {
       "Event Time": <EventTime>,
       "Event Type":<EventType>,
       "User ID": <UserID>,
       "Account ID": <AccountID>,
       "Source IP": <SourceIP>,
       "User Agent": <UserAgent>,
       "Event Source": <EventSource>,
       "AWS Region": <AWSRegion>,
       "Event Name": <EventName>,
       "Event Parameters": <EventParameters>
}



   
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_iam_configuration_changes" {
  rule      = aws_cloudwatch_event_rule.iam_configuration_changes.name
  target_id = "CloudWatch-Event-iam_configuration_changes"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "UserARN"     = "$.detail.userIdentity.arn"
      "EventSource" = "$.detail.eventSource"
      "AccountID"   = "$.detail.userIdentity.accountId"
      "SourceIP"    = "$.detail.sourceIPAddress"
      "EventType"   = "$.detail.eventType"
      "EventTime"   = "$.detail.eventTime"
      "UserAgent"   = "$.detail.userAgent"
      "AWSRegion"   = "$.detail.awsRegion"
      "EventName"   = "$.detail.eventName"
      "Elements"    = "$.detail.requestParameters[*]"
    }

    input_template = <<INPUT_TEMPLATE_EOF

 {
       "Event Time": <EventTime>,
       "User ARN":<UserARN>,
       "Account ID": <AccountID>,
       "Event Source": <EventSource>,
       "Event Type": <EventType>,
       "Event Name": <EventName>,
       "AWS Region": <AWSRegion>,
       "Source IP": <SourceIP>,
       "User Agent": <UserAgent>,
       "Elements": <Elements>
}


   
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_guardduty_findings" {
  rule      = aws_cloudwatch_event_rule.guardduty_findings.name
  target_id = "CloudWatch-Event-guardduty_findings"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"   = "$.time"
      "EventType"   = "$.detail-type"
      "EventSource" = "$.source"
      "AccountID"   = "$.account"
      "AWSRegion"   = "$.region"
      "Severity"    = "$.detail.severity"
      "Title"       = "$.detail.title"
      "Description" = "$.detail.description"
      "Finding"     = "$.detail"
    }

    input_template = <<INPUT_TEMPLATE_EOF
 {
		"Event Time": <EventTime>,
		"Event Type": <EventType>,
		"Event Source": <EventSource>,
		"Account ID": <AccountID>,
		"AWS Region": <AWSRegion>,
		"Event Severity": <Severity>,
		"Title": <Title>,
		"Description": <Description>,
		"Finding": <Finding>
}
    
INPUT_TEMPLATE_EOF

  }
}

resource "aws_cloudwatch_event_target" "sns_assume_fullAdmin" {
  rule      = aws_cloudwatch_event_rule.assume_fullAdmin_event.name
  target_id = "CloudWatch-Event-Assume-fullAdmin"
  arn       = aws_sns_topic.sns_topic_events.arn

  input_transformer {
    input_paths = {
      "EventTime"       = "$.detail.eventTime"
      "EventType"       = "$.detail-type"
      "UserID"          = "$.detail.userIdentity.arn"
      "SourceIP"        = "$.detail.sourceIPAddress"
      "UserAgent"       = "$.detail.userAgent"
      "EventSource"     = "$.detail.eventSource"
      "AWSRegion"       = "$.detail.awsRegion"
      "EventName"       = "$.detail.eventName"
      "EventParameters" = "$.detail.requestParameters[*]"
    }

    input_template = <<INPUT_TEMPLATE_EOF
{
"Event Time": <EventTime>,
"Event Type":<EventType>,
"User ID": <UserID>,
"Source IP": <SourceIP>,
"User Agent": <UserAgent>,
"Event Source": <EventSource>,
"AWS Region": <AWSRegion>,
"Event Name": <EventName>,
"Event Parameters": <EventParameters>
}
INPUT_TEMPLATE_EOF

  }
}

