--
-- *****************************************************************************
-- Customer dimension table.
-- *****************************************************************************
--
DROP TABLE customer_dv_test;
--
CREATE TABLE customer_dv_test AS
SELECT * FROM customer_dv_original;
--
-- *****************************************************************************
-- Time dimension table.
-- *****************************************************************************
--
DROP TABLE time_dv_test;
--
CREATE TABLE time_dv_test AS
SELECT CurrDate                    AS Day_ID,
  UPPER(TO_CHAR(CurrDate,'Mon'))   AS Month_ID,
  RTRIM(TO_CHAR(CurrDate,'Month')) AS Month_Desc,
  'Q'
  || UPPER(TO_CHAR(CurrDate,'Q')) AS Quarter_ID,
  'Q'
  || UPPER(TO_CHAR(CurrDate,'Q')) AS Quarter_Desc,
  TO_CHAR(CurrDate,'YYYY')        AS Year_ID,
  TO_CHAR(CurrDate,'YYYY')        AS Year_Desc
FROM
  (SELECT level n,
    TO_DATE('31/12/2005','DD/MM/YYYY') + NUMTODSINTERVAL(level,'day') CurrDate
  FROM dual
    CONNECT BY level <= 1825
  );
--
DROP TABLE product_dv_test;
--
CREATE TABLE product_dv_test AS
SELECT * FROM product_dv_original;
--
-- *****************************************************************************
-- Channel dimension table.
-- *****************************************************************************
--
DROP TABLE channel_dv_test;
--
CREATE TABLE channel_dv_test AS
SELECT * FROM channel_dv_original;
--
-- Add nulls to intermediate levels in channel.
--
UPDATE channel_dv_test
SET type_id    = NULL,
  type_desc    = NULL
WHERE class_id = 'INDIRECT';
--
COMMIT;
