variable "rgname" {
  type    = string
  default = "WebAppRG"
}

variable "env" {
  type    = string
  default = "Dev"
}

variable "server_name" {
  type        = string
  default     = "sqldbtr1"
  description = "Name of the server. "
}

variable "admin_login_name" {
  type        = string
  default     = "dbadmin"
  description = "Login name for the sql server administrator. If not set the default login name will be 'kitten83'."
}

variable "database_name" {
  type        = string
  default     = "sqldb"
  description = "Name on the initial database on the server. "
}

variable "firewall_rule_name" {
  type        = string
  default     = "AllowAccessToAll"
  description = "Firewall rule name"
}

variable "database_edition" {
  type        = string
  default     = "Basic"
  description = "Which database scaling edition the database should have."
}

variable "database_requested_service_objective_name" {
  default     = "S1"
  description = "Which service scaling objective the database should have."
}
