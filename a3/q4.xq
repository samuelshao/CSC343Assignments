<q4>
{
let $moviedoc := doc("movies.xml")
let $peopledoc := doc("people.xml")
for $movie in $moviedoc//Movie,
    $person in $peopledoc//Person
where $movie/Director[@PID = $person/@PID]
and $movie/@year >= 2001
and $person//First = "James"
and $person//Last = "Cameron"
return <q4Answer MovieTitle="{$movie/Title/text()}" MovieYear="{$movie/@year}"/>
}
</q4>