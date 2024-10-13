

db = db.getSiblingDB('strapi');
db.createUser({
  user: "strapiuser",
  pwd: "strapipassword",
  roles: [{ role: "readWrite", db: "strapi" }]
});

