# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

data "aws_ami" "linux" {
  most_recent = true
  owners = ["amazon"]
}

resource "aws_instance" "linux" {
  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
