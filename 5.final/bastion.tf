resource "aws_instance" "bastion" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = data.aws_key_pair.aws_key.key_name
  vpc_security_group_ids = [data.aws_security_group.bastion.id]

  count = 3

  subnet_id = element(data.aws_subnets.public.ids, count.index % length(data.aws_subnets.public.ids))

  tags = {
    Name = "bastion${count.index + 1}"
  }
}
