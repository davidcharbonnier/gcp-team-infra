/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

terraform {
  backend "gcs" {
    bucket = "prod-teams-infra-0"
    prefix = "dev-infra-hosting-0"
  }
}
provider "google" {
}
provider "google-beta" {
}
#provider "helm" {
#  kubernetes {
#    host                   = data.template_file.gke_endpoint.rendered
#    cluster_ca_certificate = base64decode(data.template_file.gke_ca_certificate.rendered)
#    exec {
#      api_version = "client.authentication.k8s.io/v1beta1"
#      args        = ["container", "clusters", "get-credentials", data.template_file.gke_name.rendered]
#      command     = "gcloud"
#    }
#  }
#}
#provider "kubernetes" {
#  host                   = "https://${data.template_file.gke_endpoint.rendered}"
#  cluster_ca_certificate = base64decode(data.template_file.gke_ca_certificate.rendered)
#  exec {
#      api_version = "client.authentication.k8s.io/v1beta1"
#      args        = ["container", "clusters", "get-credentials", data.template_file.gke_name.rendered]
#      command     = "gcloud"
#    }
#}

# end provider.tf for team-dev