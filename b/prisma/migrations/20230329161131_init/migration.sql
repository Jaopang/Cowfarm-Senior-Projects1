-- DropForeignKey
ALTER TABLE `Cow` DROP FOREIGN KEY `Cow_farmId_fkey`;

-- DropForeignKey
ALTER TABLE `CowEvent` DROP FOREIGN KEY `CowEvent_cowId_fkey`;

-- DropForeignKey
ALTER TABLE `CowVaccine` DROP FOREIGN KEY `CowVaccine_cowId_fkey`;

-- AddForeignKey
ALTER TABLE `Cow` ADD CONSTRAINT `Cow_farmId_fkey` FOREIGN KEY (`farmId`) REFERENCES `Farm`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CowEvent` ADD CONSTRAINT `CowEvent_cowId_fkey` FOREIGN KEY (`cowId`) REFERENCES `Cow`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CowVaccine` ADD CONSTRAINT `CowVaccine_cowId_fkey` FOREIGN KEY (`cowId`) REFERENCES `Cow`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
