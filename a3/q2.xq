<q2>
{
let $moviedoc := doc("movies.xml")
for $film in $moviedoc//Movie
return <q2Answer MID="{distinct-values($film/@MID)}" ActorCount="{count($film//Actor)}"/>
}
</q2>
