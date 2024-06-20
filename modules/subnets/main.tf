resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidrs[count.index]

  tags = {
    Name = "${var.resource_prefix}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidrs[count.index]

  tags = {
    Name = "${var.resource_prefix}-private-subnet-${count.index + 1}"
  }
}