resource "local_file" "pet" {
  filename = each.value
  content = "We love animals!"
  
  # for-each works with a set or a map only!!
  for_each = toset(var.filename)
}

output "pets" {
  value = local_file.pet
}