
<!-- README.md is generated from README.Rmd. Please edit that file -->

boltr
=====

<!-- badges: start -->
<!-- badges: end -->

This is an experimental package calling Neo4J bolt protocol from R, via
NodeJS.

Note that you’ll need to have NodeJS installed to run this.

Please do not use for now, this is still in an experimental phase.

Install
-------

    remotes::install_github("neo4r/boltr")

Use
---

The first time you will use this package, you will need to install the
Node infrastructure:

    boltr::boltr_npm_install()

Then, you can call NodeJS with:

    boltr::boltr_run(
      url = 'bolt://localhost:7687', 
      user = 'neo4j', 
      password = 'password', 
      cypher = 'MATCH (tom {name: "Tom Hanks"}) RETURN tom;'
    )
    [1] "{\"records\":[{\"keys\":[\"tom\"],\"length\":1,\"_fields\":[{\"identity\":{\"low\":71,\"high\":0},\"labels\":[\"Person\"],\"properties\":{\"name\":\"Tom Hanks\",\"born\":{\"low\":1956,\"high\":0}}}],\"_fieldLookup\":{\"tom\":0}}],\"summary\":{\"query\":{\"text\":\"MATCH (tom {name: \\\"Tom Hanks\\\"}) RETURN tom;\",\"parameters\":{}},\"queryType\":\"r\",\"counters\":{\"_stats\":{\"nodesCreated\":0,\"nodesDeleted\":0,\"relationshipsCreated\":0,\"relationshipsDeleted\":0,\"propertiesSet\":0,\"labelsAdded\":0,\"labelsRemoved\":0,\"indexesAdded\":0,\"indexesRemoved\":0,\"constraintsAdded\":0,\"constraintsRemoved\":0},\"_systemUpdates\":0},\"updateStatistics\":{\"_stats\":{\"nodesCreated\":0,\"nodesDeleted\":0,\"relationshipsCreated\":0,\"relationshipsDeleted\":0,\"propertiesSet\":0,\"labelsAdded\":0,\"labelsRemoved\":0,\"indexesAdded\":0,\"indexesRemoved\":0,\"constraintsAdded\":0,\"constraintsRemoved\":0},\"_systemUpdates\":0},\"plan\":false,\"profile\":false,\"notifications\":[],\"server\":{\"address\":\"localhost:7687\",\"version\":\"Neo4j/3.5.21\",\"protocolVersion\":3},\"resultConsumedAfter\":{\"low\":3,\"high\":0},\"resultAvailableAfter\":{\"low\":3,\"high\":0},\"database\":{\"name\":null}}}\n"

The output is the raw, unparse JSON. You can turn it to an R list with
`{jsonlite}`:

    library(magrittr)
    res <- boltr::boltr_run(
      url = 'bolt://localhost:7687', 
      user = 'neo4j', 
      password = 'password', 
      cypher = 'MATCH (tom {name: "Tom Hanks"}) RETURN tom;'
    ) %>% 
      jsonlite::fromJSON()

Output:

    res$records
      keys length                           _fields tom
    1  tom      1 71, 0, Person, Tom Hanks, 1956, 0   0

Stats:

    res$summary$updateStatistics$`_stats`
    $nodesCreated
    [1] 0

    $nodesDeleted
    [1] 0

    $relationshipsCreated
    [1] 0

    $relationshipsDeleted
    [1] 0

    $propertiesSet
    [1] 0

    $labelsAdded
    [1] 0

    $labelsRemoved
    [1] 0

    $indexesAdded
    [1] 0

    $indexesRemoved
    [1] 0

    $constraintsAdded
    [1] 0

    $constraintsRemoved
    [1] 0
