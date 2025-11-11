# Performance Monitoring

Reference: https://planetscale.com/blog/identifying-and-profiling-problematic-mysql-queries

```bash
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| airbnb_clone_db    |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.079 sec)
```
```bash
USE performance_schema;
SHOW VARIABLES LIKE 'performance_schema';
+--------------------+-------+
| Variable_name      | Value |
+--------------------+-------+
| performance_schema | ON    |
+--------------------+-------+
1 row in set (0.043 sec)
```

```bash
SELECT substring(query,1,50), avg_latency, rows_examined_avg
  FROM sys.statements_with_runtimes_in_95th_percentile
  ORDER BY rows_examined_avg
  DESC LIMIT 10;
```

```bash
SELECT query, db, exec_count, total_latency
    ->     FROM sys.statements_with_full_table_scans
    ->     ORDER BY exec_count DESC
    ->     LIMIT 5;
+-------------------------------------------------------+------+------------+---------------+
| query                                                 | db   | exec_count | total_latency |
+-------------------------------------------------------+------+------------+---------------+
| SELECT * FROM `information_schema` . `tables` LIMIT ? | NULL |          1 | 39.23 ms      |
+-------------------------------------------------------+------+------------+---------------+
1 row in set (0.043 sec)
```

