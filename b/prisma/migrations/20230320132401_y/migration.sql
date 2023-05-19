-- DropForeignKey
ALTER TABLE `Cow` DROP FOREIGN KEY `Cow_farmId_fkey`;

-- DropForeignKey
ALTER TABLE `CowEvent` DROP FOREIGN KEY `CowEvent_cowId_fkey`;

-- DropForeignKey
ALTER TABLE `CowVaccine` DROP FOREIGN KEY `CowVaccine_cowId_fkey`;

-- CreateTable
CREATE TABLE `Admin` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Admin` ADD CONSTRAINT `Admin_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cow` ADD CONSTRAINT `Cow_farmId_fkey` FOREIGN KEY (`farmId`) REFERENCES `Farm`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CowEvent` ADD CONSTRAINT `CowEvent_cowId_fkey` FOREIGN KEY (`cowId`) REFERENCES `Cow`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CowVaccine` ADD CONSTRAINT `CowVaccine_cowId_fkey` FOREIGN KEY (`cowId`) REFERENCES `Cow`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
