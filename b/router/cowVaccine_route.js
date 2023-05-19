const {
  createCowVaccine,
  getCowVaccines,
  getCowVaccine,
  updateCowVaccine,
  deleteCowVaccine,
} = require("../controller/vaccine_controller");
module.exports = function (fastify, opts, done) {
  fastify.get("/cowVaccine", getCowVaccines);
  fastify.get("/cowVaccine/:id", getCowVaccine);
  fastify.post("/cowVaccine", createCowVaccine);
  fastify.post("/cowVaccine/:id", createCowVaccine);
  fastify.put("/cowVaccine/:id", updateCowVaccine);
  fastify.delete("/cowVaccine/:id", deleteCowVaccine);
  done();
};
