<AverageOscar>
{
let $peopledoc := doc("people.xml")
let $averageOscar := count($peopledoc//Oscar/@OID) div count($peopledoc//Person)
return $averageOscar
}
</AverageOscar>