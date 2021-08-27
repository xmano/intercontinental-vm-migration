/*
 * Intercontinental VM Migration project
 *    Manohar Bangera (mano@xkanda.com)
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_compute_snapshot" "snapshot_app" {
  name        = "usa-app-01-snapshot"
  source_disk = "usa-app-01"
  zone        = "us-west1-b"
  labels = {
    my_label = "app_vm_snapshot"
  }
 
}

resource "google_compute_snapshot" "snapshot_db" {
  name        = "usa-db-01-snapshot"
  source_disk = "usa-db-01"
  zone        = "us-west1-b"
  labels = {
    my_label = "db_vm_snapshot"
  }
 
}

resource "google_compute_disk" "app-disk" {
  name  = "aus-app-01"
  type  = "pd-ssd"

  zone  = "australia-southeast1-a"
  snapshot = "usa-app-01-snapshot"
  labels = {
    environment = "app-test"
  }
  physical_block_size_bytes = 4096

  depends_on = [
    google_compute_snapshot.snapshot_app,
  ]
}

resource "google_compute_disk" "db-disk" {
  name  = "aus-db-01"
  type  = "pd-ssd"

  zone  = "australia-southeast1-a"
  snapshot = "usa-db-01-snapshot"
  labels = {
    environment = "db-test"
  }
  physical_block_size_bytes = 4096

  depends_on = [
    google_compute_snapshot.snapshot_db,
  ]
}