variable "first_instance_name" {
  description = "Value of the Name tag for the class main EC2 instance"
  type        = string
  default     = "master-node-abdullah"
}

variable "second_instance_name" {
  description = "Value of the Name tag for the class main EC2 instance"
  type        = string
  default     = "node-abdullah"
}

variable "key_path" {
  description = "SSH Public Key path"
  default     = "exam"
}