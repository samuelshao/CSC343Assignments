<q6>
{
let $peopledoc := doc("people.xml")
let $moviedoc := doc("movies.xml")
let $actors := $moviedoc//Actor/@PID
let $both := $moviedoc//*[Director/@PID = $actors]//Director/@PID
for $i in $both
return <q6Answer PID="{distinct-values($i)}" LastName="{$peopledoc//*[@PID = $i]//Last}" />
}
</q6>