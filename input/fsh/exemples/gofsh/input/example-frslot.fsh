Instance: example-frslot
InstanceOf: FrSlot
Usage: #example
* id = "example"
* meta.profile = "http://interopsante.org/fhir/StructureDefinition/FrSlot"
* identifier.use = #usual
* identifier.system = "http://example.org/slots"
* identifier.value = "451"
* serviceType = $ServiceType#1 "suivi"
* specialty = $TRE-R38-SpecialiteOrdinale#SM54 "Médecine générale (SM)"
* schedule = Reference(https://exampleserver.org/fhir/Schedule/example)
* status = #free
* start = "2019-01-04T09:15:00Z"
* end = "2019-01-04T09:30:00Z"