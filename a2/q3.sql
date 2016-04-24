SET search_path TO artistdb;

SELECT l.label_name record_label, a.year, sum(a.sales) total_sales
FROM RecordLabel l, Album a, ProducedBy p
WHERE a.album_id = p.album_id
AND l.label_id = p.label_id

GROUP BY l.label_name, a.year
HAVING sum(a.sales) > 0
ORDER BY record_label ASC, a.year ASC;