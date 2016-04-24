
let $moviedoc := doc("movies.xml")
let $genres := distinct-values($moviedoc//Category/text())
let $retstring := for $genre in $genres
return <Bar category="{$genre}" count="{count($moviedoc//Movie//*[Category/text() = $genre])}"/>
return <Stats>{$retstring}</Stats>