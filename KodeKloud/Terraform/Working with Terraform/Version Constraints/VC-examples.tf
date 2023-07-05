terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "1.4.0" # Will download v1.4.0
    }
  }
}

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "!= 2.0.0" # Will ignore v2.0.0
    }
  }
}

terraform { 
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "> 1.2.0, < 2.0.0, != 1.4.0" # Will download v1.3.0
    }
  }
}

terraform { 
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 1.2.0" # Will download the highest value of the 1.2.* version
    }
  }
}

resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content = "We love pets!"
}