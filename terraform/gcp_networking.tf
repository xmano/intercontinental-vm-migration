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

resource "google_compute_network" "tcb-gcp-network" {
  name                    = "tcb-gcp-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "tcb-gcp-subnet1" {
  name          = "tcb-gcp-subnet1"
  ip_cidr_range = var.gcp_subnet1_cidr
  network       = google_compute_network.tcb-gcp-network.name
  region        = var.gcp_region
}



