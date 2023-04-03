# Creates an AWS autoscaling group using a specified launch template
# It sets the minimum, desired, and maximum capacity of instances in the group,
# as well as health check parameters and termination policies
resource "aws_autoscaling_group" "asg" {
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
  name                      = "${var.name_prefix}-asg"
  vpc_zone_identifier       = data.aws_subnets.private.ids
  min_size                  = 3
  desired_capacity          = 3
  max_size                  = 6
  termination_policies      = ["OldestLaunchTemplate"]
  health_check_grace_period = 300
  health_check_type         = "EC2"
  depends_on = [
    aws_key_pair.aws_key
  ]

  tag {
    key                 = "Name"
    value               = var.name_prefix
    propagate_at_launch = true
  }
}