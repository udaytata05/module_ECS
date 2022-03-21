# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "testapp_log_group" {
  name              = "/ecs/testapp/${var.customer_name}"
  retention_in_days = 30

  tags = {
    Name = "cw-log-group"
    customer_name = "${var.customer_name}"
  }
}

resource "aws_cloudwatch_log_stream" "myapp_log_stream" {
  name           = "test-log-stream-${var.customer_name}"
  log_group_name = aws_cloudwatch_log_group.testapp_log_group.name
}
