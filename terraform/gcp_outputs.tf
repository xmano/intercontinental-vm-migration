/*
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Terraform output variables for GCP.
 */

output "gcp_instance_external_ip" {
  value = <<-EOF
  ${google_compute_instance.tcb-gcp-vm-01.network_interface[0].access_config[0].nat_ip}
EOF

}

output "gcp_instance_internal_ip" {
  value = google_compute_instance.tcb-gcp-vm-01.network_interface[0].network_ip
}

// External IP address of the App instance
output "app_ip" {
 value = google_compute_instance.usa-app-01.network_interface.0.access_config.0.nat_ip
}

