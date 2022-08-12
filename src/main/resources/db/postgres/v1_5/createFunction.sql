DROP FUNCTION IF EXISTS junior.get_udf_data();
CREATE OR REPLACE FUNCTION junior.get_udf_data()
			RETURNS TABLE(field_id uuid
						  ,name varchar
						  ,code varchar
						  ,item_id uuid
						  ,comment varchar
						  ,updated_dt timestamp
						  ,vol varchar)
AS
$$
BEGIN
RETURN QUERY
SELECT t1.field_id
     ,t2.name
     ,t2.code
     ,t1.item_id
     ,t1.comment
     ,t1.updated_dt
     ,t1.vol
FROM junior.udf_fielditem_filter AS t1
         JOIN junior."udf_field" AS t2
              USING(field_id);

UPDATE junior.udf_fielditem
SET updated_dt = current_timestamp;
END
$$ LANGUAGE plpgsql;