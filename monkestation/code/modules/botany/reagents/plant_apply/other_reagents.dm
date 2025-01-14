/datum/reagent/plantnutriment/eznutriment/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.yieldmod = 1
	mytray.mutmod = 1
	mytray.adjustNutri(round(volume * 1))

/datum/reagent/plantnutriment/endurogrow/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjustHealth(round(volume * 1))
	mytray.adjustHealth(round(volume * 0.25))
	mytray.adjustNutri(round(volume * 0.5))
	mytray.adjustWeeds(-1)

/datum/reagent/saltpetre/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_plant_health(round(volume * 0.18))
	mytray.myseed?.adjust_production(round(volume * 0.1))
	mytray.myseed?.adjust_potency(round(volume * 0.2))

/datum/reagent/brimdust/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.myseed?.adjust_potency(round(volume * 0.5))

/datum/reagent/water/holywater/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_waterlevel(round(volume * 1))
	mytray.adjust_plant_health(round(volume * 0.1))

/datum/reagent/lube/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.myseed?.process_trait_gain(/datum/plant_gene/trait/slip, volume * 0.25)
	mytray.myseed?.adjust_endurance(volume * 0.08)

/datum/reagent/chlorine/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_plant_health(-round(volume * 1.5))
	mytray.myseed?.adjust_lifespan(-round(volume * 0.2))

/datum/reagent/fluorine/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_plant_health(-round(volume * 2))

/datum/reagent/phosphorus/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_plant_health(-round(volume * 0.75))

/datum/reagent/uranium/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjustHealth(-round(volume * 1))
	mytray.adjustToxic(round(volume * 2))
	plant_mutation_reagent_apply(volume, mytray, user, mr = 10, hm = 5)

/datum/reagent/ammonia/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjustHealth(round(volume * 0.5))
	mytray.adjustNutri(round(volume * 1))
	if(!isnull(mytray.myseed))
		mytray.myseed?.adjust_yield(round(volume * 0.04))

/datum/reagent/diethylamine/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_plant_health(round(volume))
	mytray.adjust_pestlevel(-rand(1,2))
	if(!isnull(mytray.myseed))
		mytray.myseed?.adjust_yield(round(volume))

/datum/reagent/plantnutriment/left4zednutriment/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_plant_health(round(volume * 0.1))

/datum/reagent/plantnutriment/robustharvestnutriment/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.myseed?.adjust_potency(round(volume * 0.1))
	mytray.myseed?.adjust_yield(round(volume * 0.2))

/datum/reagent/plantnutriment/endurogrow/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.myseed?.adjust_potency(-round(volume * 0.1))
	mytray.myseed?.adjust_yield(-round(volume * 0.075))
	mytray.myseed?.adjust_endurance(round(volume * 0.35))

/datum/reagent/ash/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_plant_health(round(volume))
	mytray.adjust_weedlevel(-1)

/datum/reagent/plantnutriment/liquidearthquake/on_plant_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.myseed?.adjust_weed_rate(round(volume * 0.1))
	mytray.myseed?.adjust_weed_chance(round(volume * 0.3))
	mytray.myseed?.adjust_production(-round(volume * 0.075))

/* Original Code
	/datum/reagent/plantnutriment/eznutriment/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, round(volume * 0.15))
	seed.adjust_lifespan(round(volume * 0.15))
	seed.adjust_potency(round(volume * 0.1))
	seed.adjust_yield(round(volume * 0.1))

/datum/reagent/plantnutriment/endurogrow/on_plant_apply(obj/item/seeds/seed)
	seed.adjust_potency(-round(volume * 0.1))
	seed.adjust_yield(-round(volume * 0.075))
	seed.adjust_endurance(round(volume * 0.35))

/datum/reagent/saltpetre/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, round(volume * 0.18))
	seed.adjust_production(round(volume * 0.1))
	seed.adjust_potency(round(volume * 0.2))

/datum/reagent/brimdust/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, round(volume * 1))
	seed.adjust_potency(round(volume * 0.5))

/datum/reagent/water/holywater/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, round(volume * 0.1))

/datum/reagent/lube/on_plant_apply(obj/item/seeds/seed)
	seed.process_trait_gain(/datum/plant_gene/trait/slip, volume * 0.25)
	seed.adjust_endurance(volume * 0.08)

/datum/reagent/chlorine/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, -round(volume * 1.5))
	seed.adjust_lifespan(-round(volume * 0.2))

/datum/reagent/fluorine/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, -round(volume * 2))

/datum/reagent/phosphorus/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, -round(volume * 0.75))

/datum/reagent/uranium/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, -round(volume * 1))
	//plant_mutation_reagent_apply(chems, mytray, user, mr = 10, hm = 5)

/datum/reagent/ammonia/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, round(volume * 0.12))
	seed.adjust_maturation(round(volume * 0.2))
	seed.adjust_production(round(volume * 0.1))
	if(prob(10))
		seed.adjust_yield(1)

/datum/reagent/diethylamine/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, round(volume * 1))
	seed.adjust_yield(round(volume * 0.2))

/datum/reagent/plantnutriment/left4zednutriment/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, -1)
	seed.adjust_lifespan(-round(volume * 0.2))

	seed.adjust_endurance(round(volume * 0.1))
	seed.adjust_potency(round(volume * 0.1))
	seed.adjust_yield(round(volume * 0.1))
	seed.adjust_maturation(round(volume * 0.1))
	seed.adjust_production(round(volume * 0.1))

/datum/reagent/plantnutriment/robustharvestnutriment/on_plant_apply(obj/item/seeds/seed)
	seed.adjust_yield(round(volume * 0.35))
	seed.adjust_maturation(round(volume * 0.1))
	seed.adjust_production(round(volume * 0.05))

/datum/reagent/plantnutriment/endurogrow/on_plant_apply(obj/item/seeds/seed)
	seed.adjust_potency(-round(volume * 0.1))
	seed.adjust_yield(-round(volume * 0.075))
	seed.adjust_endurance(round(volume * 0.35))

/datum/reagent/ash/on_plant_apply(obj/item/seeds/seed)
	SEND_SIGNAL(seed, COMSIG_ADJUST_PLANT_HEALTH, round(volume * 1))

/datum/reagent/plantnutriment/liquidearthquake/on_plant_apply(obj/item/seeds/seed)
	seed.adjust_weed_rate(round(volume * 0.1))
	seed.adjust_weed_chance(round(volume * 0.3))
	seed.adjust_production(-round(volume * 0.075))
*/
