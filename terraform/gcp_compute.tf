/*
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Terraform compute resources for GCP.
 * Acquire all zones and choose one randomly.
 */

data "google_compute_zones" "available" {
  region = var.gcp_region
}



//------- Source VMs------------------------------------


// App VM
resource "google_compute_instance" "usa-app-01" {
  name         = "usa-app-01"
  machine_type = var.gcp_instance_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.gcp_disk_image
    }
  }

  //Add some metada like SSH to VM 
  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq npm zip wget"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}


// DB VM
resource "google_compute_instance" "usa-db-01" {
  name         = "usa-db-01"
  machine_type = var.gcp_instance_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.gcp_disk_image
    }
  }

  //Add some metada like SSH to VM 
  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  // Make sure node & support packages is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq npm zip wget"

  network_interface {
    network = "default"

    access_config {
      # Static IP
      nat_ip = google_compute_address.gcp-ip2.address
    }
  }
}

/*
 * -----------------------------------------------------------------
// Step2 : Create the snapshot disks 

resource "google_compute_snapshot" "usa-app01-snapshot" {
  name        = "usa-app01-snapshot"
  source_disk = google_compute_disk.persistent.name
  zone        = var.gcp_zone
  labels = {
    my_label = "value"
  }
  storage_locations = [var.gcp_region]
}


// Step 3 : Created destination VMs
// Initially these resources are turned off until disks are created.

//------- Destination VMs------------------------------------


// Note:
// This is the destination of the migration

// App VM - Oz
resource "google_compute_instance" "aus-app-01" {
  name         = "aus-app-01"
  machine_type = var.gcp_instance_type
  zone         = var.gcp_zone2

  boot_disk {
    initialize_params {
      image = var.gcp_disk_image
    }
  }

  //Add some metada like SSH to VM 
  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq npm zip wget"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
      # Static IP
      nat_ip = google_compute_address.gcp-ip3.address
    }
  }
}


// DB VM - Oz
resource "google_compute_instance" "aus-db-01" {
  name         = "aus-db-01"
  machine_type = var.gcp_instance_type
  zone         = var.gcp_zone2

  boot_disk {
    initialize_params {
      image = var.gcp_disk_image
    }
  }

  //Add some metada like SSH to VM 
  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  // Make sure node & support packages is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq npm zip wget"

  network_interface {
    network = "default"

    access_config {
      # Static IP
      nat_ip = google_compute_address.gcp-ip4.address
    }
  }
}

*/