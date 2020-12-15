const parser = require("@babel/parser");
const { readFileSync } = require('fs');

const fileName = process.argv[2];

if (!fileName) {
  console.error("no filename specified");
} else {
  const file = readFileSync(fileName, "utf8");
  const ast = parser.parse(file);

  console.log(JSON.stringify(ast, null, "  "));
}
