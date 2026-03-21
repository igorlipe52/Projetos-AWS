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
  description = "workshop-igor-key-pair-virg"
  type        = string
  default = "workshop-igor-key-pair-virg"
}

variable "instance_name" {
  description = "igor-lab-ec2"
  type        = string
  default     = "igor-lab-ec2"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "lab-igor-na-nuvem"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::198200019169:role/igor-lab-role"
    region = "us-east-1"
  }
}

variable "allowed_ssh_ip" {
  description = "SSH-IP's-allowed"
  type        = list(string)
  default     = ["0.0.0.0/0"] 
}