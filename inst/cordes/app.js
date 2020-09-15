const neo4j = require('neo4j-driver')

neo4j.driver(
      process.argv[2],
      neo4j.auth.basic(process.argv[3], process.argv[4])
    ).session()
    .run(process.argv[5])
      .then(function(result) {
        console.log(JSON.stringify(result));
        process.exit(0);
      })
      .catch(function(error) {
        console.error(error);
       process.exit(1);
      });
