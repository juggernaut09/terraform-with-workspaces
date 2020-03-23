## terraform-with-workspaces
In this terraform we are going to use multiple workspaces to store terraform state file.

# Pre-requisites:
Checkout terraform-remote-backend repository https://github.com/venkattejaRaavi/terraform-remote-backend

# terraform workspace new workspace_name
creates a new workspace, By default the terraform configuration is set to default workspace.

# terraform workspace 
This command lists the possible extensions for this command.

# Note:
Comment the s3_bucket and dynamodb_table resources once you have set the terraform configuartion to use the s3 as backend. 
