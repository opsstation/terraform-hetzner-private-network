#Description : Terraform label module variables.
variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = ""
  description = "ManagedBy, eg 'OpsStation'"
}

variable "name" {
  type        = string
  default     = ""
  description = "The name to give to the new private network. Must be unique per Hetzner project."
}

variable "attributes" {
  type = list(string)
  default = [""]
  description = "use for extra tags."
}

variable "enable" {
  type        = bool
  default     = false
  description = "Flag to control the vpc creation."
}

variable "ip_range" {
  type        = string
  default     = "10.10.0.0/16"
  description = "The IP range to give to the new network. By default it's 10.10.0.0/16 meaning the entire private network ip range."
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "Labels to attach to the new network."
}

variable "delete_protection" {
  type        = bool
  default     = false
  description = "Whether or not to enable Hetzner's delete protection. By default it is 'false'."
}

variable "expose_routes_to_vswitch" {
  type        = bool
  default     = false
  description = "Whether or not to expose the routes within the private network to vSwitches on dedicated Hetzner machines. By default this is 'false'."
}

# -------------------------------------
# Custom Variables
# -------------------------------------
variable "location" {
  type        = string
  default     = "fsn1"
  description = "The datacenter location to create the new network in. Can be one of the following: nbg1, fsn1, hel1, ash or hil. Default is 'fsn1'."
}

variable "subnets" {
  type        = any
  default     = {}
  description = "The subnets to create for the network. By default none are created."
}

variable "routes" {
  type        = any
  default     = {}
  description = "The network routes to create for the new network. By default none are created."
}
