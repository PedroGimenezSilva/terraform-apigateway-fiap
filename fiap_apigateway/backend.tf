terraform {
  backend "s3" {
    bucket         = "fiap-terraform-state-bucket"  
    key            = "apigateway/fiap_apigateway/terraform.tfstate"     
    region         = "us-east-1"  
                     
  }
}
