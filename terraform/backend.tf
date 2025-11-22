terraform {
  backend "gcs" {
    bucket  = "tf-state"
    prefix  = "terraform/dev-state"
  }
}
