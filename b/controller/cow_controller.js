const prisma = require("../src/connection");

module.exports.createCow = async function (req, reply) {
  console.log(req.body);
  const { cowImage, cowName, rfId, dobtime, sex, detail, farmId } = req.body;
  console.log(dobtime);
  const newCow = await prisma.Cow.create({
    data: {
      cowImage,
      cowName,
      rfId,
      dobCow: new Date(dobtime),
      sex,
      detail,
      farmId: Number(farmId),
    },
  });
  reply.code(201).send(newCow);
};

module.exports.getCows = async function (req, reply) {
  const Cows = await prisma.Cow.findMany();
  reply.send(Cows);
};

module.exports.getCow = async function (req, reply) {
  const { id } = req.params;
  const Cow = await prisma.Cow.findUnique({
    where: {
      id: Number(id),
    },
  });
  reply.send(Cow);
};

module.exports.updateCow = async function (req, reply) {
  const { id } = req.params;
  const { cowImage, cowName, rfId, dobCow, sex, detail } = req.body;
  const updatedCow = await prisma.Cow.update({
    where: {
      id: Number(id),
    },
    data: {
      cowImage,
      cowName,
      rfId,
      dobCow,
      sex,
      detail,
    },
  });
  reply.send(updatedCow);
};

module.exports.deleteCow = async function (req, reply) {
  const { id } = req.params;
  const deletedCow = await prisma.Cow.delete({
    where: {
      id: Number(id),
    },
    rejectOnNotFound: false,
  });
  reply.send(deletedCow);
};
