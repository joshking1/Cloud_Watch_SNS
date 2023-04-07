resource "aws_sns_topic" "my_sns_topic" {
  name = "MySnsTopic"
}

resource "aws_cloudwatch_metric_alarm" "iam_user_signin_alarm" {
  alarm_name          = "IAM User Sign-In Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ConsoleSignInSuccess"
  namespace           = "AWS/IAM"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"

  dimensions = {
    Username = "<chelsea-ahmed>"
  }

  alarm_description = "Alarm triggered when any IAM user logs into the AWS Management Console."

  alarm_actions = [
    aws_sns_topic.my_sns_topic.arn
  ]
}

output "sns_topic_arn" {
  value = aws_sns_topic.my_sns_topic.arn
}