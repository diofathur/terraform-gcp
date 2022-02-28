// configure the GCP Console
provider "google" {
  credentials = file("file.json")
  project     = "refined-core-336804"
  region      = "asia-southeast2"
}