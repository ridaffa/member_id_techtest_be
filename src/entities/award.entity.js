class awardEntity {
  constructor() {
    this.id = 0;
    this.award_type_id = 0;
    this.voucher_id = 0;
    this.product_id = 0;
    this.points = 0;
    this.image = '';
    this.createdAt = new Date();
    this.updatedAt = new Date();
    this.deletedAt = new Date();
  }
}

class awardDTO {
  constructor() {
    this.id = 0;
    this.points = 0;
    this.image = '';
  }
}

module.exports = {
  awardEntity,
  awardDTO,
};