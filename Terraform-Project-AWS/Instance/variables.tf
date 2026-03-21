variable "region" {
  description = "us-east-1"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ami-02dfbd4ff395f2a1b"
  type        = string
  default = "ami-02dfbd4ff395f2a1b"
}

variable "instance_type" {
  description = "t3.micro"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "<YOUR-KEY-NAME>"
  type        = string
  default = "<YOUR-KEY-NAME>"
}

variable "instance_name" {
  description = "<YOUR-INSTANCE-NAME>"
  type        = string
  default     = "<YOUR-INSTANCE-NAME>"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "<YOUR-PROJECT-NAME>"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "<YOUR-IAM-ARN-ROLE>"
    region = "us-east-1"
  }
}

variable "allowed_ssh_ip" {
  description = "SSH-IP's-allowed"
  type        = list(string)
  default     = ["0.0.0.0/0"] 
}
