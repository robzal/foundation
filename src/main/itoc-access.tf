module "itoc_access" {
  source           = "git@github.com:robzal/foundation_modules.git//src/modules/itoc_access?ref=v1.1.0"
  write_access     = true
  managed_services = true
}
