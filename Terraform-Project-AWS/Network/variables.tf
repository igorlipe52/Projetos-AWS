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
    arn    = "<YOU-IAM-ARN-ROLE>"
    region = "us-east-1"
  }
}

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })

  default = {
    name                     = "<YOUR-VPC-NAME>"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "<YOUR-IGW-NAME>"
    nat_gateway_name         = "<YOUR-NATGW-NAME>"
    public_route_table_name  = "<YOUR-PUBLIC-RT-NAME>"
    private_route_table_name = "<YOUR-PRIVATE-RT-NAME>"
    public_subnets = [{
      name                    = "<YOUR-PUBLIC-SUBNET-NAME>"
      cidr_block              = "10.0.0.0/26"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "<YOUR-PUBLIC-SUBNET-NAME>"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "<YOUR-PRIVATE-SUBNET-NAME>"
      cidr_block              = "10.0.0.128/26"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "<YOUR-PRIVATE-SUBNET-NAME>"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = false
    }]
  }
}
