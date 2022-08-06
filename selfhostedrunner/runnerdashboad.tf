resource "aws_cloudwatch_dashboard" "runner-dashboard" {
  dashboard_name = "runner-dashboard"
  dashboard_body = <<EOF
{
    "widgets": [
        {
            "height": 2,
            "width": 4,
            "y": 5,
            "x": 8,
            "type": "metric",
            "properties": {
                "metrics": [
                    [ "CWAgent", "disk_used_percent", "InstanceId", "${aws_instance.runner.id}", { "region": "eu-central-1" } ]
                ],
                "view": "singleValue",
                "region": "eu-central-1",
                "period": 60,
                "title": "Disk space utilization",
                "stat": "Average"
            }
        },
        {
            "height": 7,
            "width": 8,
            "y": 0,
            "x": 0,
            "type": "metric",
            "properties": {
                "metrics": [
                    [ "CWAgent", "mem_used_percent", "InstanceId", "${aws_instance.runner.id}" ]
                ],
                "view": "timeSeries",
                "stacked": true,
                "region": "eu-central-1",
                "title": "Memory Utilization",
                "period": 60,
                "stat": "Average"
            }
        },
        {
            "height": 7,
            "width": 9,
            "y": 0,
            "x": 15,
            "type": "metric",
            "properties": {
                "metrics": [
                    [ "AWS/EC2", "CPUUtilization", "InstanceId", "${aws_instance.runner.id}" ]
                ],
                "view": "timeSeries",
                "stacked": true,
                "region": "eu-central-1",
                "title": "CPU utilization",
                "period": 60,
                "stat": "Average"
            }
        },
        {
            "height": 6,
            "width": 24,
            "y": 7,
            "x": 0,
            "type": "log",
            "properties": {
                "query": "SOURCE '/aws/ec2/epam-py-runner/' | fields @timestamp, @message\n| filter @message like /Running job/\n| sort @timestamp desc\n| limit 20",
                "region": "eu-central-1",
                "stacked": false,
                "title": "RUNNED: /aws/ec2/epam-py-runner/",
                "view": "table"
            }
        },
        {
            "height": 3,
            "width": 3,
            "y": 0,
            "x": 12,
            "type": "metric",
            "properties": {
                "metrics": [
                    [ "CWAgent", "Running job", { "region": "eu-central-1" } ]
                ],
                "view": "singleValue",
                "stacked": false,
                "region": "eu-central-1",
                "period": 3600,
                "stat": "Sum",
                "title": "jobs last 1 hour"
            }
        },
        {
            "height": 3,
            "width": 3,
            "y": 3,
            "x": 12,
            "type": "metric",
            "properties": {
                "metrics": [
                    [ "CWAgent", "failed" ]
                ],
                "view": "singleValue",
                "stacked": false,
                "region": "eu-central-1",
                "period": 3600,
                "stat": "Sum",
                "title": "errors last 1 hour"
            }
        },
        {
            "height": 4,
            "width": 24,
            "y": 13,
            "x": 0,
            "type": "log",
            "properties": {
                "query": "SOURCE '/aws/ec2/epam-py-runner/' | fields @timestamp, @message\n| filter @message like /Process completed with exit code 254/\n| sort @timestamp desc\n| limit 20",
                "region": "eu-central-1",
                "stacked": false,
                "title": "FAILED: /aws/ec2/epam-py-runner/",
                "view": "table"
            }
        },
        {
            "height": 5,
            "width": 2,
            "y": 0,
            "x": 8,
            "type": "log",
            "properties": {
                "query": "SOURCE '/aws/ec2/epam-py-runner/' | fields @timestamp, @message\n| sort @timestamp desc\n| filter @message like \"Running job\"\n| stats count() by bin(60m)",
                "region": "eu-central-1",
                "title": "Running jobs",
                "view": "bar"
            }
        },
        {
            "height": 5,
            "width": 2,
            "y": 0,
            "x": 10,
            "type": "log",
            "properties": {
                "query": "SOURCE '/aws/ec2/epam-py-runner/' | fields @timestamp, @message\n| sort @timestamp desc\n| filter @message like \"Process completed with exit code 254\"\n| stats count() by bin(60m)",
                "region": "eu-central-1",
                "stacked": false,
                "title": "Failed jobs",
                "view": "bar"
            }
        }
    ]
}
   EOF 
}