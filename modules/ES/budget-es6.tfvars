vpc_name                = "vpc-test"
name                    = "test-es"
availability_zone_count = 1
elasticsearch_version   = "6.8"
instance_type           = "t2.small.elasticsearch"
instance_count          = 1
ebs_volume_type         = "gp2"
ebs_volume_size         = 10