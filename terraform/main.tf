/*
 * Intercontinental VM Migration project
 *    Manohar Bangera (mano@xkanda.com)
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Terraform main configuration file (with provider definitions).
 */

provider "google" {
  version = "~> 3.19.0"

  credentials = file(var.gcp_credentials_file_path)

  # Should be able to parse project from credentials file but cannot.
  # Cannot convert string to map and cannot interpolate within variables.
  project = var.gcp_project_id

  region = var.gcp_region
}

