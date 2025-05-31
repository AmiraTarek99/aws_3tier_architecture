 output ex_alb_sg {
   value       = aws_security_group.external_alb.id

 }

  output be_sg {
   value       = aws_security_group.backend-sg.id

 }

   output int_alb_sg {
   value       = aws_security_group.internal-alb.id

 }
 

  output fe_sg {
   value       = aws_security_group.frontend-sg.id

 }

 output db_sg {
   value       = aws_security_group.DB-sg.id

 }