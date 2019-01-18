
variable "AWS_REGION" {
  default = "us-east-1"
}

variable "VPC_ID" {
  default = ""
}

variable "SUBNET_LIST" {
  type = "list"

}

variable "TAGS" {
  type = "map"
  default = {
      "Project"  = "terraform"
  }
}


variable "AmiId" {
  description = "Image ID to use"
}


variable "InstanceKeyPairName" {
  description = "Required: Key pair for the ec2 instances"
}

variable "AWS_ACCESS_KEY" {
  
}
variable "AWS_SECRET_KEY" {
  
}

