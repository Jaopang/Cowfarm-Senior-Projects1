-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `name` VARCHAR(150) NULL,
    `password` VARCHAR(150) NOT NULL,
    `lineId` VARCHAR(150) NULL,
    `userImage` LONGTEXT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Farm` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `farmName` VARCHAR(150) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Farm_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cow` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cowImage` LONGTEXT NULL,
    `cowName` VARCHAR(150) NOT NULL,
    `rfId` VARCHAR(150) NULL,
    `dobCow` DATETIME(3) NOT NULL,
    `sex` VARCHAR(150) NOT NULL,
    `detail` VARCHAR(500) NULL,
    `farmId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CowEvent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `semen` VARCHAR(150) NOT NULL,
    `breed` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `cowId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CowVaccine` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameVaccineTH` VARCHAR(150) NOT NULL,
    `nameVaccineEng` VARCHAR(150) NOT NULL,
    `vaccineId` VARCHAR(150) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `cowId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Farm` ADD CONSTRAINT `Farm_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cow` ADD CONSTRAINT `Cow_farmId_fkey` FOREIGN KEY (`farmId`) REFERENCES `Farm`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CowEvent` ADD CONSTRAINT `CowEvent_cowId_fkey` FOREIGN KEY (`cowId`) REFERENCES `Cow`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CowVaccine` ADD CONSTRAINT `CowVaccine_cowId_fkey` FOREIGN KEY (`cowId`) REFERENCES `Cow`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
