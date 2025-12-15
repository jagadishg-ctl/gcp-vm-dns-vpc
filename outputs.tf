
output "vm_external_ip" {
  value       = module.vm.external_ip
  description = "Public IP of the sample web VM"
}
