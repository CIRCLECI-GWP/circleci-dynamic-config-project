var axios = require("axios"),
  assert = require("assert"),
  helloWorld = require("../app.js"),
  base_url = "http://localhost:5000/";

describe("Welcome to CI/CD Server", function () {
  describe("GET /", function () {
    it("returns status code 200", function (done) {
      axios
        .get(base_url)
        .then((response) => {
          assert.equal(200, response.status);
          helloWorld.close();
          done();
        })
        .catch((error) => {
          done(error);
        });
    });
  });

  describe("welcomeMessage", function () {
    it("Validate Message", function () {
      const res = helloWorld.welcomeMessage();
      const message = "Welcome to CI/CD 101 using CircleCI!";
      assert.equal(res, message);
    });
  });
});
