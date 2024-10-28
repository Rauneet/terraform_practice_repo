output "vpc" {
    value = module.vpc.name
}

output "vpc_id" {
    value = module.vpc.default_vpc_id
}