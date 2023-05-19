const prisma = require("../src/connection");

module.exports.createCowEvent = async function (req, reply) {
  console.log(req.body);
  const { semen, breed, id } = req.body;
  const newCowEvent = await prisma.CowEvent.create({
    data: {
      semen,
      breed: new Date(breed),
      cowId: Number(id),
    },
  });
  reply.code(201).send(newCowEvent);
};

module.exports.getCowEvents = async function (req, reply) {
  const CowEvents = await prisma.CowEvent.findMany();
  reply.send(CowEvents);
};

module.exports.getCowEvent = async function (req, reply) {
  const { id } = req.params;
  const CowEvent = await prisma.CowEvent.findUnique({
    where: {
      id: Number(id),
    },
  });
  reply.send(CowEvent);
};

module.exports.updatedCowEvent = async function (req, reply) {
  const { id } = req.params;
  const { semen, breed } = req.body;
  const updatedCowEvent = await prisma.CowEvent.update({
    where: {
      id: Number(id),
    },
    data: {
      semen,
      breed: new Date(breed),
    },
  });
  reply.send(updatedCowEvent);
};

module.exports.deletedCowEvent = async function (req, reply) {
  const { id } = req.params;
  const deletedCowEvent = await prisma.CowEvent.delete({
    where: {
      id: Number(id),
    },
  });
  reply.send(deletedCowEvent);
};
