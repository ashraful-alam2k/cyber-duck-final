# Creates an AWS launch template with 
# a bash script for installing MySQL, and AWS CLI, 
# and configures its key, block device, and network interface settings.
resource "aws_launch_template" "launch_template" {
  name          = "${var.name_prefix}-lt"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.aws_key.key_name
  user_data = base64encode(<<-EOF
  #!/bin/bash
  # Install MySQL client
  apt update -y
  apt install -y mysql-client mysql-server
  apt install -y awscli
  EOF
  )

  block_device_mappings {
    device_name = var.device_name

    ebs {
      volume_size = var.volume_size
    }
  }

  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups             = [aws_security_group.app.id]
  }


}