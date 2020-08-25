package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestAwsVpcSubnet(t *testing.T) {
	t.Parallel()

	expectedCidrBlock:= "10.0.0.0/16"

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/vpc_subnet",
		Upgrade:      true,
		Vars: map[string]interface{}{
			"vpc_name"            : "VPC-test",
			"cidr_block"          : expectedCidrBlock,
			"subnet_name"         : "Subnet-test",
			"availability_zones"  : []string{"eu-west-1a","eu-west-1b","eu-west-1c"},
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	cidrBlock := terraform.Output(t, terraformOptions, "cidr_block")
	assert.Equal(t, expectedCidrBlock, cidrBlock)
}
