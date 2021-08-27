/*
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Terraform security (firewall) resources for GCP.
 */


# Allow SSH for iperf testing.
resource "google_compute_firewall" "gcp-allow-ssh" {
  name    = "${google_compute_network.i18n-gcp-network.name}-gcp-allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "0.0.0.0/0",
  ]
}

# Allow TCP:3000 for App access
resource "google_compute_firewall" "gcp-allow-tcp" {
  name    = "${google_compute_network.i18n-gcp-network.name}-allow-app-port-3000"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  source_ranges = [
    "0.0.0.0/0",
  ]
}

