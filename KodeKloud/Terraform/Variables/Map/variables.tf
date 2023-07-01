variable "file-content" {
  type = map(string)
  default = {
    "statement1" = "We love pets!"
    "statement2" = "We love animals!"
  }
}