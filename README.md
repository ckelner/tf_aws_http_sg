# tf_aws_http_sg
A very simple module to create an AWS VPC SG that allows only HTTP traffic.
Primarily for use in demonstrating terraform modules.

# Input Variables
- `name_prefix`: (Optional) The name prefix to use with the security group
  - default `""`
- `description`: (Optional) The description for the security group
  - default: `HTTP access from the world`
- `vpc_id`: (Required) The VPC to create the security group in
- `tags`: (Optional) Tags to apply to the security group
  - default: `{}`

# Usage
```hcl
module "http_security_group" {
  source      = "github.com/ckelner/tf_aws_http_sg?ref=v1.0"
  vpc_id      = "${aws_vpc.main.id}"
  name_prefix = "http"
  tags        = {
    "Terraform" = "true"
  }
}
```

# Outputs
- `id` - the ID of the security group
- `vpc_id` - the ID of the VPC the security group belongs to
- `name` - the name of the security group

# Authors

[Chris Kelner](http://github.com/ckelner)

# License

MIT; see [LICENSE](LICENSE) for details.
