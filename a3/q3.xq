<q3>
{
let $peopledoc := doc("people.xml")
let $havepob := $peopledoc//*[@pob]//@PID
for $person in $peopledoc//Person
where not ($person//@PID = $havepob)
return <q3Answer PID="{$person/@PID}" Lastname="{$person//Last/text()}"/>
}
</q3>

