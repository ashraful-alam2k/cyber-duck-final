name_prefix    = "cyber-duck"
image_id       = "ami-09744628bed84e434"
instance_type  = "t2.micro"
device_name    = "/dev/sda1"
volume_size    = 8
key_pair_name  = "cyber-duck"
db_name_prefix = "cyberduck"

web_ingress_rules = [
  {
    description = "Allow all inbound  from the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
]

web_egress_rules = [
  {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
]

app_ingress_rules = [
  {
    description = "Allow inbound HTTP traffic from the web security group"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  },
  {
    description = "Allow inbound HTTPS traffic from the web security group"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }
]

app_egress_rules = [
  {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
]

app_ingress_rules_bastion = [
  {
    description = "Allow SSH from the web security group"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

  }
]

bastion_ingress_rules = [
  {
    description = "Allow SSH for bastions"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
]

bastion_egress_rules = [
  {
    description = "Allow all egress for bastion"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]





