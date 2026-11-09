variable "rules" {
  description = "Value for rules."
  type = map(object({
    network              = string
    direction            = string
    action               = string
    ranges               = list(string)
    sources              = list(string)
    targets              = list(string)
    priority             = number
    use_service_accounts = bool
    enable_logging       = bool
    rules = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
  default = {}
}
