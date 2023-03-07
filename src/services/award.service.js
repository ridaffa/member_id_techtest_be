
const awardRepository = require('../repositories/award.repository');

const find = async (minPoint, maxPoint, awardTypeIds, page, limit) => {
  const offset = (page - 1) * limit;
  const data = await awardRepository.find(minPoint, maxPoint, awardTypeIds, offset, limit);
  return data;
}

module.exports = {
  find,
};