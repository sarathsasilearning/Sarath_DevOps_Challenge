package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/gruntwork-io/terratest/modules/azure"
    "github.com/stretchr/testify/assert"
)

// TestTerraformAzureWebApp tests the Azure Web App configuration
func TestTerraformAzureWebApp(t *testing.T) {
    t.Parallel()

    // Define the Terraform options
    terraformOptions := &terraform.Options{
        TerraformDir: "../path/to/your/terraform/code",
        Vars: map[string]interface{}{
            "env": "test",
        },
    }

    // Cleanup resources after the test
    defer terraform.Destroy(t, terraformOptions)

    // Deploy the Terraform configuration
    terraform.InitAndApply(t, terraformOptions)

    // Get the resource group name and web app name from Terraform outputs
    resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
    webAppName := terraform.Output(t, terraformOptions, "web_app_name")

    // Test 1: Ensure only necessary ports are open
    securityGroup := azure.GetNetworkSecurityGroup(t, resourceGroupName, "your-nsg-name")
    assert.Len(t, securityGroup.SecurityRules, 1, "Only one security rule should be present")
    assert.Equal(t, "Tcp", *securityGroup.SecurityRules[0].Protocol, "Protocol should be TCP")
    assert.Equal(t, "22", *securityGroup.SecurityRules[0].DestinationPortRange, "Only port 22 should be open")

    // Test 2: Ensure HTTPS is enforced
    webApp := azure.GetWebApp(t, resourceGroupName, webAppName)
    assert.Equal(t, true, *webApp.HttpsOnly, "HTTPS should be enforced")

    // Test 3: Ensure TLS/SSL certificate is implemented
    assert.NotNil(t, webApp.SslState, "SSL state should not be nil")
    assert.Equal(t, "SniEnabled", *webApp.SslState, "SSL state should be SniEnabled")
}