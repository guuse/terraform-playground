package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"strings"
	"testing"
)

func TestAwsEs(t *testing.T) {
	t.Parallel()

	expectedName			:= fmt.Sprintf("terratest-%s", strings.ToLower(random.UniqueId()))
	expectedSecuritygroups	:= []string{"sg-abee33d2", "sg-d3f32eaa"}

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/ES",
		Upgrade:      true,
		Vars: map[string]interface{}{
			"name":                   	expectedName,
			"security_groups":        	expectedSecuritygroups,
			"vpc_id":                 	"vpc-14051c70",
			"availability_zone_count":	1,
			"subnet_ids":             	[]string{"subnet-7637d13f", "subnet-86381bde", "subnet-d86a8dbf"},
			"elasticsearch_version":  	"6.8",
			"instance_type":          	"t2.small.elasticsearch",
			"instance_count":         	1,
			"ebs_volume_type":        	"gp2",
			"ebs_volume_size":        	10,
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	domainName := terraform.Output(t, terraformOptions, "domain_name")
	assert.Equal(t, expectedName, domainName)

	//securityGroups := terraform.Output(t, terraformOptions, "security_groups")
	//assert.Equal(t, expectedSecuritygroups, securityGroups)
}
