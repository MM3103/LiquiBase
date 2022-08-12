DROP VIEW IF EXISTS junior."udf_fielditem_filter";
CREATE OR REPLACE VIEW junior.udf_fielditem_filter(item_id, field_id, comment, updated_dt, vol)
AS
SELECT *
FROM junior."udf_fielditem"
WHERE vol > '183';