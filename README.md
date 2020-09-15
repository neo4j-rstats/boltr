
<!-- README.md is generated from README.Rmd. Please edit that file -->

boltr
=====

<!-- badges: start -->
<!-- badges: end -->

This is an experimental calling Neo4J bolt protocol from R, via NodeJS.

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
    [1] "{\"records\":[{\"keys\":[\"tom\"],\"length\":1,\"_fields\":[{\"identity\":{\"low\":71,\"high\":0},\"labels\":[\"Person\"],\"properties\":{\"name\":\"Tom Hanks\",\"born\":{\"low\":1956,\"high\":0}}}],\"_fieldLookup\":{\"tom\":0}}],\"summary\":{\"query\":{\"text\":\"MATCH (tom {name: \\\"Tom Hanks\\\"}) RETURN tom;\",\"parameters\":{}},\"queryType\":\"r\",\"counters\":{\"_stats\":{\"nodesCreated\":0,\"nodesDeleted\":0,\"relationshipsCreated\":0,\"relationshipsDeleted\":0,\"propertiesSet\":0,\"labelsAdded\":0,\"labelsRemoved\":0,\"indexesAdded\":0,\"indexesRemoved\":0,\"constraintsAdded\":0,\"constraintsRemoved\":0},\"_systemUpdates\":0},\"updateStatistics\":{\"_stats\":{\"nodesCreated\":0,\"nodesDeleted\":0,\"relationshipsCreated\":0,\"relationshipsDeleted\":0,\"propertiesSet\":0,\"labelsAdded\":0,\"labelsRemoved\":0,\"indexesAdded\":0,\"indexesRemoved\":0,\"constraintsAdded\":0,\"constraintsRemoved\":0},\"_systemUpdates\":0},\"plan\":false,\"profile\":false,\"notifications\":[],\"server\":{\"address\":\"localhost:7687\",\"version\":\"Neo4j/3.5.21\",\"protocolVersion\":3},\"resultConsumedAfter\":{\"low\":5,\"high\":0},\"resultAvailableAfter\":{\"low\":4,\"high\":0},\"database\":{\"name\":null}}}\n"

The output is the raw, unparse JSON. You can turn it to an R list with
`{jsonlite}`:

    library(magrittr)
    boltr::boltr_run(
      url = 'bolt://localhost:7687', 
      user = 'neo4j', 
      password = 'password', 
      cypher = 'MATCH (tom {name: "Tom Hanks"}) RETURN tom;'
    ) %>% 
      jsonlite::fromJSON()
    $records
      keys length                           _fields tom
    1  tom      1 71, 0, Person, Tom Hanks, 1956, 0   0

    $summary
    $summary$query
    $summary$query$text
    [1] "MATCH (tom {name: \"Tom Hanks\"}) RETURN tom;"

    $summary$query$parameters
    named list()


    $summary$queryType
    [1] "r"

    $summary$counters
    $summary$counters$`_stats`
    $summary$counters$`_stats`$nodesCreated
    [1] 0

    $summary$counters$`_stats`$nodesDeleted
    [1] 0

    $summary$counters$`_stats`$relationshipsCreated
    [1] 0

    $summary$counters$`_stats`$relationshipsDeleted
    [1] 0

    $summary$counters$`_stats`$propertiesSet
    [1] 0

    $summary$counters$`_stats`$labelsAdded
    [1] 0

    $summary$counters$`_stats`$labelsRemoved
    [1] 0

    $summary$counters$`_stats`$indexesAdded
    [1] 0

    $summary$counters$`_stats`$indexesRemoved
    [1] 0

    $summary$counters$`_stats`$constraintsAdded
    [1] 0

    $summary$counters$`_stats`$constraintsRemoved
    [1] 0


    $summary$counters$`_systemUpdates`
    [1] 0


    $summary$updateStatistics
    $summary$updateStatistics$`_stats`
    $summary$updateStatistics$`_stats`$nodesCreated
    [1] 0

    $summary$updateStatistics$`_stats`$nodesDeleted
    [1] 0

    $summary$updateStatistics$`_stats`$relationshipsCreated
    [1] 0

    $summary$updateStatistics$`_stats`$relationshipsDeleted
    [1] 0

    $summary$updateStatistics$`_stats`$propertiesSet
    [1] 0

    $summary$updateStatistics$`_stats`$labelsAdded
    [1] 0

    $summary$updateStatistics$`_stats`$labelsRemoved
    [1] 0

    $summary$updateStatistics$`_stats`$indexesAdded
    [1] 0

    $summary$updateStatistics$`_stats`$indexesRemoved
    [1] 0

    $summary$updateStatistics$`_stats`$constraintsAdded
    [1] 0

    $summary$updateStatistics$`_stats`$constraintsRemoved
    [1] 0


    $summary$updateStatistics$`_systemUpdates`
    [1] 0


    $summary$plan
    [1] FALSE

    $summary$profile
    [1] FALSE

    $summary$notifications
    list()

    $summary$server
    $summary$server$address
    [1] "localhost:7687"

    $summary$server$version
    [1] "Neo4j/3.5.21"

    $summary$server$protocolVersion
    [1] 3


    $summary$resultConsumedAfter
    $summary$resultConsumedAfter$low
    [1] 2

    $summary$resultConsumedAfter$high
    [1] 0


    $summary$resultAvailableAfter
    $summary$resultAvailableAfter$low
    [1] 1

    $summary$resultAvailableAfter$high
    [1] 0


    $summary$database
    $summary$database$name
    NULL
