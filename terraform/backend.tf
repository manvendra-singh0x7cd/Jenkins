terraform{
    backend "s3"{
        bucket = "jenkins-terraform-state-sf"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}