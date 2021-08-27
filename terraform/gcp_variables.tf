/*
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Terraform variable declarations for GCP.
 * Final values of var can be defined in terraform.tfvars
 */

variable "gcp_credentials_file_path" {
  description = "Locate the GCP credentials .json file."
  type        = string
}

variable "gcp_project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "gcp_region" {
  description = "Default to Oregon region."
  default     = "us-west1"
}

variable "gcp_zone" {
  description = "Default to Oregon region."
  default     = "us-west1-b"
}

variable "gcp_region2" {
  description = "Default to Sydney region."
  default     = "australia-southeast1"
}

variable "gcp_zone2" {
  description = "Default to Sydney region."
  default     = "australia-southeast1-a"
}

variable "gcp_instance_type" {
  description = "Machine Type. Correlates to an network egress cap."
  default     = "e2-micro"
}

variable "gcp_disk_image" {
  description = "Boot disk for gcp_instance_type."
  default     = "debian-cloud/debian-10"
}

variable "gce_ssh_pub_key_file" {
  description = "Location of SSH public key file"
  default     = "~/.ssh/vm-ssh-key.pub"
}

variable "gce_ssh_user" {
  description = "User loggin in via SSH - username"
  default     = "supermano"
}


