/*
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Terraform networking resources for GCP.
 */

resource "google_compute_network" "i18n-gcp-network" {
  name                    = "i18n-gcp-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_address" "gcp-ip" {
  name   = "gcp-vm-ip"
  region = var.gcp_region
}

resource "google_compute_address" "gcp-ip2" {
  name   = "gcp-vm-ip2"
  region = var.gcp_region
}

resource "google_compute_address" "gcp-ip3" {
  name   = "gcp-vm-ip3"
  region = var.gcp_region2
}

resource "google_compute_address" "gcp-ip4" {
  name   = "gcp-vm-ip4"
  region = var.gcp_region2
}


