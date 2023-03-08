const db = require("../config/database");
const { awardDTO } = require("../entities/award.entity");
const { awardTypeDTO } = require("../entities/award_type.entity");
const { productDTO } = require("../entities/product.entity");
const { voucherDTO } = require("../entities/voucher.entity");

const find = async (minPoint, maxPoint, awardTypeIds, offset, limit) => {
  const award = new awardDTO()
  const awardKey = Object.keys(award)
  const awardType = new awardTypeDTO()
  const awardTypeKey = Object.keys(awardType)
  const voucher = new voucherDTO()
  const voucherKey = Object.keys(voucher)
  const product = new productDTO()
  const productKey = Object.keys(product)
  const { rows } = await db.query(
    `SELECT ${awardKey.map((key) => `awards.${key}`).join(", ")
    }, 
    row_to_json(award_types.*) as award_type,
    row_to_json(vouchers.*) as voucher,
    row_to_json(products.*) as product 
    FROM awards 
    JOIN (
      SELECT ${awardTypeKey.map((key) => `award_types.${key}`).join(", ")} FROM award_types WHERE deleted_at IS NULL
      ) as award_types ON awards.award_type_id = award_types.id
    LEFT JOIN (
      SELECT ${voucherKey.map((key) => `vouchers.${key}`).join(", ")} FROM vouchers WHERE deleted_at IS NULL
    ) as vouchers ON awards.voucher_id = vouchers.id
    LEFT JOIN (
      SELECT ${productKey.map((key) => `products.${key}`).join(", ")} FROM products  WHERE deleted_at IS NULL
    )as products ON awards.product_id = products.id 
    WHERE deleted_at IS NULL
    AND awards.points >= $1
    AND awards.points <= $2
    AND awards.award_type_id ${awardTypeIds.length === 0 ? "IS NOT NULL" : `IN (${awardTypeIds.join(", ")})`
    }
    ORDER BY awards.award_type_id ASC, awards.points DESC
    LIMIT $3 
    OFFSET $4`,
    [minPoint, maxPoint, limit, offset]
  );
  const { rows: count } = await db.query(
    "SELECT COUNT(*) FROM awards"
  );
  const totalPages = Math.ceil(count[0].count / limit);
  return { rows, totalPages };
}

module.exports = {
  find,
};