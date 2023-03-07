class userEntity {
  constructor() {
    this.id = 0;
    this.name = '';
    this.email = '';
    this.password = '';
    this.createdAt = new Date();
    this.updatedAt = new Date();
  }
}

class userDTO {
  constructor() {
    this.id = 0;
    this.name = '';
    this.email = '';
  }
}