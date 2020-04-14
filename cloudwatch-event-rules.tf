resource "aws_cloudwatch_event_rule" "S3" {
  name        = "${var.appenv}-capture-aws-S3-Modification"
  description = "Capture each AWS S3 Modficiation"

  event_pattern = <<PATTERN
{
  "detail": {
    "eventName": [
      "PutBucketAcl",
      "PutBucketPolicy",
      "PutBucketCors",
      "PutBucketLifecycle",
      "PutBucketReplication",
      "DeleteBucketPolicy",
      "DeleteBucketCors",
      "DeleteBucketLifecycle",
      "DeleteBucketReplication"
    ],
    "eventSource": [
      "s3.amazonaws.com"
    ]
  },
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "source": [
    "aws.s3"
  ]
}
PATTERN

}

resource "aws_cloudwatch_event_rule" "ec2_changes" {
  name        = "${var.appenv}-capture-aws-ec2-modifications"
  description = "Capture each AWS ec2 Modficiation"

  event_pattern = <<PATTERN
{
  "detail": {
    "eventSource": [
      "ec2.amazonaws.com"
    ]
  },
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "source": [
    "aws.ec2"
  ]
}
PATTERN

}

resource "aws_cloudwatch_event_rule" "cloudtrail_configuration_changes" {
  name        = "${var.appenv}-capture-aws-cloudtrail-modification"
  description = "Capture changes to CloudTrail Logging Configuration"

  event_pattern = <<PATTERN
{
  "detail": {
    "eventName": [
      "StopLogging",
      "StartLogging",
      "UpdateTrail",
      "DeleteTrail",
      "CreateTrail",
      "RemoveTags",
      "AddTags",
      "PutEventSelectors"
    ],
    "eventSource": [
      "cloudtrail.amazonaws.com"
    ]
  },
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "source": [
    "aws.cloudtrail"
  ]
}
PATTERN

}

resource "aws_cloudwatch_event_rule" "network_gateway_changes" {
  name        = "${var.appenv}-capture-aws-network-gateway-modification"
  description = "Capture each modification event for Customer and Internet Gateways"

  event_pattern = <<PATTERN
{
  "detail": {
    "eventName": [
      "CreateCustomerGateway",
      "DeleteCustomerGateway",
      "AttachInternetGateway",
      "CreateInternetGateway",
      "DeleteInternetGateway",
      "DetachInternetGateway"
    ],
    "eventSource": [
      "cloudtrail.amazonaws.com"
    ]
  },
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "source": [
    "aws.cloudtrail"
  ]
}
PATTERN

}

resource "aws_cloudwatch_event_rule" "config_configuration_changes" {
  name        = "${var.appenv}-capture-aws-config-configuration-modification"
  description = "Capture changes to AWS Config service configuration "

  event_pattern = <<PATTERN
{
  "source": [
    "aws.config"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "config.amazonaws.com"
    ],
    "eventName": [
      "DeleteDeliveryChannel",
      "DeleteConfigurationRecorder",
      "StopConfigurationRecorder",
      "DeleteConfigRule",
      "DeleteEvaluationResults",
      "DeletePendingAggregationRequest",
      "DeleteAggregationAuthorization",
      "DeleteConfigurationAggregator"
    ]
  }
}
PATTERN

}

resource "aws_cloudwatch_event_rule" "iam_configuration_changes" {
  name        = "${var.appenv}-capture-aws-iam-configuration-modification"
  description = "Capture changes to AWS IAM configuration "

  event_pattern = <<PATTERN

{
 "source": [
   "aws.iam"
 ],
 "detail-type": [
   "AWS API Call via CloudTrail"
 ],
 "detail": {
   "eventSource": [
     "iam.amazonaws.com"
   ],
   "eventName": [
     "AddUserToGroup",
     "AttachGroupPolicy",
     "AttachRolePolicy",
     "AttachUserPolicy",
     "CreateAccessKey",
     "CreateAccountAlias",
     "CreateGroup",
     "CreateLoginProfile",
     "CreatePolicy",
     "CreateRole",
     "CreateServiceLinkedRole",
     "CreateUser",
     "CreateVirtualMFADevice",
     "DeactivateMFADevice",
     "DeleteAccessKey",
     "DeleteAccountAlias",
     "DeleteAccountPasswordPolicy",
     "DeleteGroup",
     "DeleteGroupPolicy",
     "DeleteLoginProfile",
     "DeletePolicy",
     "DeleteRole",
     "DeleteRolePolicy",
     "DeleteSSHPublicKey",
     "DeleteServiceLinkedRole",
     "DeleteUser",
     "DeleteUserPermissionsBoundary",
     "DeleteUserPolicy",
     "DeleteVirtualMFADevice",
     "DetachGroupPolicy",
     "DetachRolePolicy",
     "DetachUserPolicy",
     "PutGroupPolicy",
     "PutRolePolicy",
     "PutUserPolicy",
     "RemoveUserFromGroup",
     "UpdateAccessKey",
     "UpdateAccountPasswordPolicy",
     "UpdateAssumeRolePolicy",
     "UpdateUser"
   ]
 }
}

PATTERN

}

resource "aws_cloudwatch_event_rule" "guardduty_findings" {
  name        = "${var.appenv}-capture-aws-guardduty-findings"
  description = "Capture findings provided by GuardDuty"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.guardduty"
  ],
  "detail-type": [
    "GuardDuty Finding"
  ]
}
PATTERN

}

resource "aws_cloudwatch_event_rule" "assume_fullAdmin_event" {
  name        = "${var.appenv}-capture-aws-assume-fullAdmin"
  description = "Capture events matching AssumeRole for fullAdmin and orgAdmin"

  event_pattern = <<PATTERN
{
"source":[
"aws.sts"
],
"detail-type":[
"AWS API Call via CloudTrail"
],
"detail":{
"eventSource":[
"sts.amazonaws.com"
],
"eventName":[
"AssumeRole"
],
"requestParameters":{
"roleArn":[
"arn:aws:iam::*:role/${var.appenv}-management-orgAdmin",
"arn:aws:iam::${data.aws_caller_identity.current_user.account_id}:role/${var.appenv}-management-fullAdmin"
]
}
}
}
PATTERN

}
