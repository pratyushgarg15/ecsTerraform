output "tg_arn" {
  value = aws_lb_target_group.pratyushTG.arn
  }

output "lb-arn" {
  value = aws_lb.pratyushALB.arn
}
