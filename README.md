Complex queries in BigQuery often involve the use of advanced SQL techniques and functions to solve specific business problems. Here are some scenario-based questions along with examples that require complex queries in BigQuery:

### 1. **Scenario: Window Functions**
   - *Imagine you have a table of sales transactions with columns for product_id, sale_date, and revenue. Write a query to calculate the cumulative revenue for each product over time.*

   ```sql
   SELECT
     product_id,
     sale_date,
     revenue,
     SUM(revenue) OVER (PARTITION BY product_id ORDER BY sale_date) AS cumulative_revenue
   FROM
     sales_table;
   ```

### 2. **Scenario: Aggregation and Pivot**
   - *You have a table containing user events with columns user_id, event_type, and event_count. Write a query to pivot the data to show the total count of each event type for each user.*

   ```sql
   SELECT
     user_id,
     MAX(IF(event_type = 'type1', event_count, NULL)) AS type1_count,
     MAX(IF(event_type = 'type2', event_count, NULL)) AS type2_count,
     -- Repeat for other event types
   FROM
     events_table
   GROUP BY
     user_id;
   ```

### 3. **Scenario: Recursive Query**
   - *Assume you have a hierarchical table representing organizational structure with columns employee_id, manager_id, and salary. Write a query to calculate the total salary for each employee and their subordinates.*

   ```sql
   WITH RECURSIVE EmployeeHierarchy AS (
     SELECT employee_id, manager_id, salary FROM employees
     UNION ALL
     SELECT e.employee_id, e.manager_id, eh.salary FROM employees e
     JOIN EmployeeHierarchy eh ON e.employee_id = eh.manager_id
   )
   SELECT employee_id, SUM(salary) AS total_salary
   FROM EmployeeHierarchy
   GROUP BY employee_id;
   ```

### 4. **Scenario: Time Series Analysis**
   - *Given a table of daily stock prices with columns symbol, date, and closing_price, write a query to calculate the 7-day moving average for each stock.*

   ```sql
   SELECT
     symbol,
     date,
     closing_price,
     AVG(closing_price) OVER (PARTITION BY symbol ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_average
   FROM
     stock_prices;
   ```

### 5. **Scenario: Unnesting Arrays**
   - *You have a table with an array column containing product categories. Write a query to count the number of products in each category.*

   ```sql
   SELECT
     category,
     COUNT(product) AS product_count
   FROM
     products_table,
     UNNEST(categories) AS category
   GROUP BY
     category;
   ```

### 6. **Scenario: Geospatial Analysis**
   - *Assuming you have a table with geospatial data (latitude and longitude), write a query to find the nearest points to a given location.*

   ```sql
   WITH NearestPoints AS (
     SELECT
       point_id,
       ST_DISTANCE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-73.9857, 40.7488)) AS distance
     FROM
       geospatial_table
   )
   SELECT
     point_id,
     distance
   FROM
     NearestPoints
   ORDER BY
     distance
   LIMIT 5;
   ```

### 7. **Scenario: Working with JSON Data**
   - *Assume you have a table with a JSON column containing information about user preferences. Write a query to extract and aggregate data from the JSON column.*

   ```sql
   SELECT
     JSON_EXTRACT(payload, '$.category') AS category,
     COUNT(*) AS count
   FROM
     preferences_table
   GROUP BY
     category;
   ```

These scenario-based questions cover a range of advanced SQL concepts in BigQuery, including window functions, aggregation, recursive queries, time series analysis, array unnesting, geospatial analysis, and working with JSON data. These examples can help assess a candidate's ability to handle complex queries and solve real-world problems using BigQuery.
