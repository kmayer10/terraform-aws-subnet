data "aws_availability_zones" "aws_availability_zones" {}

resource "aws_subnet" "aws_subnet" {
  count = length(data.aws_availability_zones.aws_availability_zones.names)
  availability_zone = data.aws_availability_zones.aws_availability_zones.names[count.index]
  vpc_id = var.vpc_id
  cidr_block = "10.${var.vpc_cidr_block_second_digit}.${var.vpc_cidr_block_third_digit+count.index}.0/24"
  map_public_ip_on_launch = var.type == "private" ? false : true
  tags = {
    Name = "${var.Name}_${var.type}_${count.index+1}"
    type = var.type
  }
}
