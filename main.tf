resource "aws_db_instance" "main" {
  identifier                 = "${var.identifier}"
  allocated_storage          = "${var.allocated_storage}"
  engine                     = "${var.engine}"
  engine_version             = "${var.engine_version}"
  instance_class             = "${var.instance_class}"
  apply_immediately          = "${var.apply_immediately}"
  name                       = "${var.name}"
  username                   = "${var.username}"
  password                   = "${var.password}"
  port                       = "${var.database_port}"
  vpc_security_group_ids     = ["${var.db_security_group}"]
  db_subnet_group_name       = "${var.db_subnet_group_name}"
  multi_az                   = "${var.multi_az}"
  publicly_accessible        = "${var.publicly_accessible}"
  storage_encrypted          = "${var.storage_encrypted}"
  storage_type               = "${var.storage_type}"
  skip_final_snapshot        = "${var.skip_final_snapshot}"
  final_snapshot_identifier  = "final-${var.identifier}-${var.env}"
  backup_retention_period    = "${var.backup_retention_period}"
  maintenance_window         = "${var.maintenance_window}"
  monitoring_interval        = "${var.monitoring_interval}"
  monitoring_role_arn        = "${var.monitoring_role_arn}"
  auto_minor_version_upgrade = "${var.auto_minor_version_upgrade}"

  tags {
    Environment = "${var.env}"
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name    = "${var.domain_sub_name}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = "${aws_db_instance.main.address}"
    zone_id                = "${aws_db_instance.main.hosted_zone_id}"
    evaluate_target_health = true
  }
}
