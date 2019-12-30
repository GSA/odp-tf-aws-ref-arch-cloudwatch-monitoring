# Terraform module for Cloudwatch Based Monitoring, Alerting, and SNS Notifications

  

This terraform module will create AWS Cloudwatch Rules/Metrics/Events/Targets and two AWS SNS Topics which can be manually subscribed to after creation for email based alerts.

  

## Prerequisites

  

A Cloudwatch log group and Cloud Trail must setup outside this module.

  

## Monitored Activity

**Cloudwatch Events**

 - S3 Modifications
   
  - Config Compliance
   
   - Config Modifications
   
   - EC2 Modifications
   
   - Cloudtrail Modifications
   
   - Network Gateway Modifications
   
   - IAM Modifications
   
   - Guard Duty Modifications
   
   - STS Assume Role Events

 **Cloudwatch Alarms**

- Root Account Usage

- Console Signin Failures

- CMK Key Disable/Deletions

- Console Signin's without MFA

- S3 Bucket Activity

- Security Group Modifications

- ACL Modifications

- Network Gateway Modifications

- VPC Modifications

- EC2 Modifications (Create/Start/Stop/Terminate/Reboot Actions)

- Cloudtrail Modifications

- Unauthenticated API Calls

- Unauthorized API Calls

- IAM Modifications

## Module Input Variables

  *  `appenv` - The Applications Environment (Dev, Test, Prod)

*  `cloudtrail_name` - Specifies the name of the cloudtrail

*  `cloudwatch_log_group` - The name of the pre-exsisting Log Group utilized by Cloudtrail

*  `sns_topic_alarms` - The name of the created SNS Topic for Alarms

*  `sns_topic_events` - The name of the created SNS Topic for Events

*  `sns_topic_events` - The name of the created SNS Topic for Events

*  `alarm_namespace` - The namespace in which all alarms are set up

*  `treat_missing_data` - The value used by all aws_cloudwatch_metric_alarm for the treat_missing_data property

*  `deletion_window` - The value of how many days the key exsists after resource deletion

*  `is_enabled` - Used for enabling/disabling of kms keys

*  `is_key_rotation_enabled` - Used for enabling/disabling of automatic kms key rotation

*  `kms_alarm_alias` - The alias name for the alarms kms key

*  `kms_event_alias` - The alias name for the events kms key

  
  

## Usage
```
module "cloudwatch_monitoring" {
source = "github.com/GSA/odp-tf-aws-ref-arch-cloudwatch-monitoring"
appenv = "${var.appenv}"
cloudwatch_log_group = "${var.cloudwatch_log_group}"
sns_topic_alarms = "${var.sns_topic_alarms}"
sns_topic_events = "${var.sns_topic_events}"
}
```
**Remember to subscribe to the SNS Topics!**
