variable "resource_group_name" {
  default = "rg-capstone-devops"
}

variable "location" {
  default = "eastus"
}

variable "team_member_upns" {
  type = list(string)

  default = [
    "elwr223@uky.edu",
    "jfpe228@uky.edu",
    "jli340@uky.edu",
    "dwmc238@uky.edu",
    "cebr276@uky.edu"
  ]
}
