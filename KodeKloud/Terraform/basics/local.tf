resource "local_file" "pet" {
    filename = "/home/ubuntu-mw/Documents/KodeKloud/Terraform/basics/pets.txt"
    content = "We love pets!"
    file_permission = "0700"
}