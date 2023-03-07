const awardService = require('../services/award.service');

exports.find = async (req, res) => {
  try {
    const page = req.query.page || 1;
    const limit = req.query.limit || 10;
    const minPoint = req.query.min_point || 0;
    const maxPoint = req.query.max_point || 0;
    const awardTypeIdsStr = JSON.parse(req.query.award_types) || [];
    const awardTypeIds = awardTypeIdsStr.map(Number);
    const data = await awardService.find(minPoint, maxPoint, awardTypeIds, page, limit);
    res.status(200).send({
      message: { data: data.rows, total_pages: data.totalPages, current_page: page, limit: limit },
    });
  } catch (err) {
    res.status(500).send({
      message: "internal server error",
    });
  }
};