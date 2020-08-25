provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "selected" {
  tags = {
    Name   = var.vpc_name
  }
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["subnet-test-public-eu-west-1a"]
  }
}

data "aws_security_groups" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

module "elasticsearch" {
  source                          = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=master"
  vpc_id                          = data.aws_vpc.selected.id
  subnet_ids                      = data.aws_subnet_ids.selected.ids
  security_groups                 = data.aws_security_groups.selected.ids
  name                            = var.name
  availability_zone_count         = var.availability_zone_count
  zone_awareness_enabled          = false
  elasticsearch_version           = var.elasticsearch_version
  instance_type                   = var.instance_type
  instance_count                  = var.instance_count
  ebs_volume_type                 = var.ebs_volume_type
  ebs_volume_size                 = var.ebs_volume_size
  create_iam_service_linked_role  = false
  encrypt_at_rest_enabled         = false
}