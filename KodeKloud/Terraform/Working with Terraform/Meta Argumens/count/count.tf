resource "local_file" "pet" {
  filename = var.filename[count.index]
  content = "We love animals!"
  
  # Using list of variables
  count = length(var.filename)
}

output "pets" {
  value = local_file.pet
}