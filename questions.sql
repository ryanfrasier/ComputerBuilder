-- 1. How much is the RTX 3060?
SELECT cost
FROM graphicsProcessingUnit
WHERE modelName = 'GeForce RTX 3060';

-- 2. Are there any CPUs that cost less than $200?
SELECT *
FROM centralProcessingUnit
WHERE cost < 200.00;

-- 3. What is the most expensive AMD CPU?
SELECT modelName, cost
FROM centralProcessingUnit
WHERE manufacturer = 'AMD'
ORDER BY cost DESC
LIMIT 1;

-- 4. Are there any intel products?
SELECT *
FROM (
  SELECT modelName, manufacturer
  FROM centralProcessingUnit
  UNION ALL
  SELECT modelName, manufacturer
  FROM graphicsProcessingUnit
  UNION ALL
  SELECT modelName, manufacturer
  FROM motherboard
  UNION ALL
  SELECT modelName, manufacturer
  FROM powerSupplyUnit
  UNION ALL
  SELECT modelName, manufacturer
  FROM randomAccessMemory
  UNION ALL
  SELECT modelName, manufacturer
  FROM solidStateDrive
  UNION ALL
  SELECT modelName, manufacturer
  FROM hardDrive
  UNION ALL
  SELECT modelName, manufacturer
  FROM heatSink
) AS products
WHERE manufacturer = 'Intel';

-- 5. What SSD has the most storage?
SELECT modelName, storageSize
FROM solidStateDrive
WHERE storageSize = (
  SELECT MAX(storageSize)
  FROM solidStateDrive
);

-- 6. What are the least expensive Heat Sink?
SELECT modelName, cost
FROM heatSink
ORDER BY cost ASC
LIMIT 1;

-- 7. What is the least expensive AMD motherboard?
SELECT modelName, cost
FROM motherboard
WHERE manufacturer = 'AMD'
ORDER BY cost ASC
LIMIT 1;

-- 8. What is the least expensive CPU?
SELECT modelName, manufacturer, cost
FROM centralProcessingUnit
ORDER BY cost ASC
LIMIT 1;
