output "bastion_public_ips" {
  value = "Use any of this IPs to SSH into bastion: ${join(",", aws_instance.bastion[*].public_ip)}"
}

output "ec2_private_ips" {
  value = "Use any of these IPs to SSH into EC2 instances: ${join(",", data.aws_instances.ec2_instances.private_ips)}"
}

output "rds_connection_parameters" {
  description = "RDS instance connection parameters"
  value       = "Please input this in your terminal to connect DB from EC2 instances: \n mysql -h ${data.aws_rds_cluster.rds_cluster.endpoint} -u ${nonsensitive(local.secret.username)} -p${nonsensitive(local.secret.password)}"
}
