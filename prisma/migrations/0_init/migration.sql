-- DropIndex
DROP INDEX `price_search` ON `prices`;

-- DropIndex
DROP INDEX `product_search` ON `products`;

-- CreateIndex
CREATE INDEX `price_search` ON `prices`(`title`, `description`);

-- CreateIndex
CREATE INDEX `product_search` ON `products`(`title`, `description`);

