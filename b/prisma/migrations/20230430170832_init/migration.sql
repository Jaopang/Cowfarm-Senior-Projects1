-- DropForeignKey
ALTER TABLE `Cow` DROP FOREIGN KEY `Cow_farmId_fkey`;

-- AddForeignKey
ALTER TABLE `Cow` ADD CONSTRAINT `Cow_farmId_fkey` FOREIGN KEY (`farmId`) REFERENCES `Farm`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
