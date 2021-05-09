{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "lambda:InvokeFunction",
      "Resource": [
        "${default_lambda_arn}",
        "${connect_lambda_arn}",
        "${disconnect_lambda_arn}",
        "${random_word_lambda_arn}"
      ],
      "Condition": {
        "ArnLike": {
          "AWS:SourceArn": "${wss_api_arn}"
        }
      }
    }
  ]
}