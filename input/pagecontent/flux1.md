### Les flux de gestion de ressource 

#### Flux 1a - Création d'une ressource

Ce flux permet la création d’une ressource. Une ressource est toute personne, lieu ou objet disposant d’un agenda dans le système de gestion d’agendas partagés. Une ressource peut représenter :

* **Une personne prise en charge** : un patient ou une personne prise en charge au niveau sanitaire, médicoadministratif, médico-social ou social.
* **Un professionnel** : une personne qui participe à la prise en charge d’une autre personne que ce soit au niveau sanitaire, médico-administratif, médico-social ou social.
* **Un contact** : un membre de la famille ou un proche de la personne prise en charge.
* **Une organisation interne** : un type de service proposé par un établissement pour lequel une personne prise en charge peut prendre rendez-vous. Il s’agit par exemple d’un service de cardiologie dans un hôpital ou une unité d’échographie dans un centre d’imagerie médicale.
* **Un lieu** : Informations relatives à une portion déterminée de l’espace, fixe ou mobile, du point de vue de son affectation ou de ce qui s’y passe. Un box de consultation par exemple.
* **Un équipement opérationnel** : une ressource matérielle nécessaire à la réalisation d’une activité. Un scanner par exemple.

Une ressource représentant une personne peut être étendue à un lieu. Par exemple, un professionnel dans un de ses lieux d’exercice constitue une ressource d’agenda.

Ce flux permet donc l’envoi des détails d’une ressource au gestionnaire de ressources. Il véhicule les attributs des classes d’objet qui correspondent aux ressources métier.

Ce flux correspond à une requête HTTP POST avec une ressource Patient | PractitionerRole | Practitioner | Device | Location | HealthcareService (Organization) | RelatedPerson.

#### Flux 1b - Mise à jour d'une ressource

Ce flux permet la mise à jour d’une ressource. Son contenu est similaire à celui du flux 1a de création de ressource.

Ce flux correpsond à une requête HTTP PUT avec une ressource Patient | PractitionerRole | Practitioner | Device | Location | HealthcareService (Organization) | RelatedPerson

#### Flux 1c - Suppression d'une ressource

Ce flux permet de supprimer une ressource.

A noter que dans cette spécification ne sont pas décrites les règles de contrôle devant être réalisées par le gestionnaire suite à la demande de suppression. Par exemple, la suppression de la ressource entraine la suppression des agendas qui lui sont liés, uniquement s’il est l'unique propriétaire des agendas en question.

Ce flux correspond à une requête HTTP DELETE sur une ressource Patient | PractitionerRole | Practitioner | Device | Location | HealthcareService (Organization) | RelatedPerson

### Les ressources d'agenda

* Patient : profil FrPatient
* PractitionerRole : AsPractitionerRole
* Practitioner : profil FrPractitioner
* RelatedPerson : profil FrRelatedPerson
* Location : profil FrLocation
* HealthcareService : profil FrHealthcareService
* Organization : profil FrOrganization
* Device

Pour les ressources de type personne, il est important de recueillir l’adresse électronique pour permettre l’envoi de notifications et l’envoi d’objets iCalendar, après mise en correspondance (cf. Annexe 1), pour une meilleure intégration dans les agendas électronique non spécifiques au secteur.

Pour plus d'information sur les profils, consultez les dépendances et les guides d'implémentations associés.

**Ressource « Patient »**
La ressource Patient représente la personne prise en charge. Pour ce volet, le profil français FrPatient du package FrCore, défini par HL7 France, doit être utilisé. Dans les spécifications fonctionnelles de ce volet, seules les informations minimales d’identification et de contact du patient sont mentionnées, cependant, les autres éléments de la ressource peuvent aussi être utilisés.

**Ressources « Practitioner » et « PractitionerRole »**
Les ressources Practitioner et PractitionerRole représentent respectivement le professionnel et le couple exercice professionnel et situation d’exercice au sein d’un établissement. Pour ce volet, le profil français FrPractitioner du package FrCore défini par HL7 France et les profils AsPractitionerRole du package annuaire de l’annuaire santé doivent être utilisés.

Comme pour le patient, tout élément de ces ressources peut être utilisé même s’il ne fait pas partie des
informations minimales mentionnées dans les spécifications fonctionnelles du volet.

La prise de rendez-vous se fait avec un professionnel dans une situation donnée d’exercice professionnel. L’agenda et les disponibilités et rendez-vous qui y sont rattachés devraient donc être liés à la situation d’exercice, elle-même liée au professionnel. Ainsi c’est la ressource PractitionerRole qui devrait être référencée comme acteur d’agenda ou comme participant à un rendez-vous. Cependant pour des raisons techniques et afin de faciliter les recherches de disponibilités et de rendez-vous, les deux types de ressources doivent être référencés lorsque l’acteur est un professionnel en exercice. Ainsi, en termes de profils, les instances de AsPractitionerRole et FrPractitioner, si elles existent, doivent être référencées entre elles.

**Ressource « RelatedPerson »**
La Ressource RelatedPerson représente une personne proche du patient, son tuteur légal par exemple. Pour ce volet, le profil français FrRelatedPerson du package FrCore, défini par HL7 France, doit être utilisé. Les projets peuvent avoir recours à cette ressource s’ils trouvent opportun de créer un agenda dédié à cette personne.
Des éléments autres que ceux mentionnés dans les spécifications fonctionnelles du volet peuvent être utilisés. 

**Ressource « Device »**
La ressource Device représente un équipement qui peut être réservé pour un rendez-vous et disposant donc d’un agenda, un échographe par exemple. Des éléments autres que ceux mentionnés dans les spécifications
fonctionnelles du volet peuvent être utilisés.

**Ressource « Location »**
La ressource Location représente un lieu qui peut être réservé pour un rendez-vous et disposant donc d’un agenda, un box de consultation par exemple. Pour ce volet, le profil français de la ressource, FrLocation du package FrCore défini par HL7 France, doit être utilisé. Des éléments autres que ceux mentionnés dans les spécifications fonctionnelles du volet peuvent être utilisés.

**Ressources « HealthcareService » et « Organization »**
Les ressources Organization et HealthcareService représentent respectivement un établissement (entité
géographique) et une organisation interne qui y est proposée. Pour ce volet, les profils français de ces ressources, FrOrganization et FrHealthcareService du package FrCore, définis par HL7 France doivent être utilisés.


La prise de rendez-vous peut s’effectuer avec une organisation interne qui peut donc disposer d’un agenda. Les attributs de l’établissement servent essentiellement à l’identification de l’organisation interne et à la recherche deressources.