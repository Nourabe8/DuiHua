output "instance_id_1" {
  description = "Instance ID"
  value = aws_instance.master.id
}   

output "instance_id_2" {
  description = "Instance ID"
  value = aws_instance.node.id
}   

output "instance_public_dns_1" {
  description = "Instance public dns for class main"
  value = aws_instance.master.public_dns
}


output "instance_public_dns_2" {
  description = "Instance public dns for class main"
  value = aws_instance.node.public_dns
}