terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.1"
    }
    random = {
      source = "hashicorp/random" 
      version = "3.4.3"
    }
  }
}