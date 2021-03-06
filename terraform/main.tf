# Filename: main.tf

# GCP project
provider "google" {
    project = var.project_id
}

# Deploy image to Cloud Run
resource "google_cloud_run_service" "appnode" {
    name = var.cloudrun_name
    location = var.zones["uscentral"]
    template {
        spec {
            containers {
                image = var.container_gcp
            }
        }
    }
    traffic {
        percent         = 100
        latest_revision =  true
    }
}


# Public Access
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.appnode.location
  project     = google_cloud_run_service.appnode.project
  service     = google_cloud_run_service.appnode.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

# Return service URL
output "url" {
  value = google_cloud_run_service.appnode.status[0].url
}