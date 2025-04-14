package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestAppServiceConfiguration(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
	}

	// Fetch outputs
	resourceGroup := terraform.Output(t, terraformOptions, "resource_group_name")
	appName := terraform.Output(t, terraformOptions, "web_app_name")
	location := terraform.Output(t, terraformOptions, "resource_group_location")
	hostname := terraform.Output(t, terraformOptions, "web_app_default_hostname")

	// Validate App Name
	assert.NotEmpty(t, appName, "App Name should not be empty")
	assert.True(t, strings.HasPrefix(appName, "1-webapp-prod-"), "App name should start with '1-webapp-prod-'")
	assert.Equal(t, "1-webapp-prod-fmc", appName, "App name should match the expected value")

	// Validate Resource Group
	assert.Equal(t, "1-webapp-prod-fmc-group", resourceGroup, "Resource group name should match the expected value")

	// Validate Location
	assert.Equal(t, "eastus2", location, "Resource group location should be 'eastus2'")

	// Validate Default Hostname
	assert.Equal(t, "1-webapp-prod-fmc.azurewebsites.net", hostname, "Web App hostname should match the expected value")
}
