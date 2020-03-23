provider "aws" {
    region = "us-east-2"
    profile = "Administrator"
}

# Comment the aws_s3_bucket and aws_dynamodb_table resources once you have created.
resource "aws_s3_bucket" "terraform_state" {
    # Replace this with your bucket name!
    bucket = "terraform-up-and-running-state-4567"

    # Enable versioning so we can see the full revision history of our
    # state files

    versioning {
        enabled = true
    }
    # Enable server-side encryption by default
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}


resource "aws_dynamodb_table" "terraform_locks" {
    name         = "terraform-up-and-running-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID" 
    attribute {
        name = "LockID"
        type = "S"
    }
}

resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro" 
}

terraform {
    backend "s3" {
        # Replace this with your bucket name!
        bucket = "terraform-up-and-running-state-4567"
        key = "workspaces-example/terraform.tfstate"
        region = "us-east-2"


        #Replace this with your dynamodb table name
        dynamodb_table = "terraform-up-and-running-locks"
        encrypt = true
    }
}