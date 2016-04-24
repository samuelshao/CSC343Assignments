<q5>
{
let $oscardoc := doc("oscars.xml")
let $moviedoc := doc("movies.xml")
let $movieoscar := $moviedoc//Oscar/@OID
let $award := distinct-values($oscardoc//*[@OID = $movieoscar]//Type/text())
for $awardname in $award, $oscar in $oscardoc//Oscar, $movie in $moviedoc//Movie
where $oscar/Type/text() = $awardname
and $oscar/@year = min($oscardoc//*[Type/text() = $awardname]//@year)
and $movie//@OID = $oscar/@OID
return <q5Answer AwardName="{$awardname}" FirstAwardYear="{min($oscardoc//*[Type/text() = $awardname]//@year)}" AwardedMovie="{$movie//Title/text()}"/>
}
</q5> 