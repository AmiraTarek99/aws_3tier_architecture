 output vpc-id {
   value       = aws_vpc.my_vpc.id

 }

  output vpc-cidr {
   value       = aws_vpc.my_vpc.id

 }

  output pub-subnets {
   value       = aws_subnet.public_subnet[*].id

 }

 output priv-subnets {
   value       = aws_subnet.private_subnet[*].id

 }