resource "aws_rds_cluster" "main" {
  cluster_identifier      = "${var.env}-rds"
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = var.database_name
  master_username         = data.aws_ssm_parameter.user
  master_password         = data.aws_ssm_parameter.pass
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  db_subnet_group_name    = aws_docdb_subnet_group.main.name

  tags = merge(
    var.tags,
    {Name = "${var.env}-rds"}
  )
}

resource "aws_docdb_subnet_group" "main" {
  name       = "${var.env}-rds"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    {Name = "${var.env}-subnet-group"}
  )
}