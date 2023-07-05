variable "filename" {
  # for-each works with a set or a map only!!
  type = set(string)

  default = [
    "/root/pets.txt",
    "/root/dogs.txt",
    "/root/cats.txt"
  ]
}