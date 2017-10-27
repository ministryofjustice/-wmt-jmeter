SELECT DISTINCT(r.id)
FROM app.workload w
  JOIN app.workload_points_calculations wpc ON wpc.workload_id = w.id
  JOIN app.workload_report wr ON wpc.workload_report_id = wr.id
  JOIN app.workload_owner wo ON w.workload_owner_id = wo.id
  JOIN app.team t ON wo.team_id = t.id
  JOIN app.ldu l ON t.ldu_id = l.id
  JOIN app.region r ON l.region_id = r.id
WHERE wr.effective_to IS NULL
  AND wr.effective_from IS NOT NULL
