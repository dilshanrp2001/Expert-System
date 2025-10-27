% ==============================================================================
% Holiday Destination Advisor Knowledge Base
% ==============================================================================

% --- Facts about Destinations (Unchanged) ---
destination(tokyo, city, year_round, high, culture, group, high_tech).
destination(bali, beach, year_round, medium, relaxation, romance, wellness).
destination(swiss_alps, nature, winter, high, adventure, family, skiing).
destination(paris, city, spring_autumn, medium, romance, romance, iconic).
destination(costa_rica, nature, summer, medium, adventure, solo, eco_tourism).
destination(rome, city, spring_autumn, medium, culture, family, history).
destination(thailand, beach, winter, low, relaxation, solo, nightlife).
destination(new_york, city, year_round, high, culture, solo, nightlife).
destination(greece, beach, summer, medium, romance, family, islands).
destination(kyoto, culture, spring_autumn, medium, culture, romance, zen).
destination(machu_picchu, nature, summer, medium, adventure, solo, hiking).
destination(london, city, year_round, medium, culture, family, theatre).
destination(iceland, nature, summer, high, adventure, group, scenic_drive).
destination(maui, beach, year_round, high, relaxation, family, luxury).
destination(cairo, city, winter, low, culture, group, history).
destination(patagonia, nature, summer, high, adventure, solo, trekking).
destination(vienna, city, winter, medium, culture, romance, opera).
destination(maldives, beach, year_round, very_high, relaxation, romance, overwater_bungalow).

% ==============================================================================
% --- GROUP 1: LUXURY, ROMANCE & HIGH BUDGET RULES (1-10) ---
% ==============================================================================

% Rule 1: Ultimate Luxury Honeymoon
recommend_holiday(
    destination: maldives,
    reason: 'Exclusive, very high-budget trip perfect for couples needing maximum privacy and relaxation.'
) :-
    requirement(travel_style, romance),
    requirement(destination_type, beach),
    requirement(budget, very_high),
    requirement(activity, relaxation).

% Rule 2: High-End Culture & Shopping
recommend_holiday(
    destination: new_york,
    reason: 'High-budget trip combining world-class culture, theatre, and high-energy city life.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(budget, high).

% Rule 3: Luxury Family Beach Vacation
recommend_holiday(
    destination: maui,
    reason: 'High-end, family-friendly beach vacation with great infrastructure.'
) :-
    requirement(destination_type, beach),
    requirement(travel_style, family),
    requirement(budget, high),
    requirement(activity, relaxation).

% Rule 4: Romantic European Getaway (Winter/Culture)
recommend_holiday(
    destination: vienna,
    reason: 'Classic romantic European city with a focus on classical culture and history.'
) :-
    requirement(travel_style, romance),
    requirement(destination_type, city),
    requirement(season, winter),
    requirement(activity, culture).

% Rule 5: Romantic European Getaway (Shoulder/Iconic)
recommend_holiday(
    destination: paris,
    reason: 'Iconic romantic city best enjoyed in the milder shoulder seasons.'
) :-
    requirement(travel_style, romance),
    requirement(destination_type, city),
    requirement(season, spring_autumn).

% Rule 6: Luxury Adventure/Scenic Drive
recommend_holiday(
    destination: iceland,
    reason: 'Unique high-budget adventure focused on nature, great for groups or solos.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    requirement(budget, high).

% Rule 7: Luxury City Fallback
recommend_holiday(
    destination: tokyo,
    reason: 'High-budget city trip focusing on advanced culture and technology.'
) :-
    requirement(destination_type, city),
    requirement(budget, high).

% Rule 8: High Budget, High Adventure
recommend_holiday(
    destination: patagonia,
    reason: 'High-budget, challenging trekking and nature adventure.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    requirement(budget, high).

% Rule 9: Romantic Beach Fallback
recommend_holiday(
    destination: bali,
    reason: 'Medium-budget, well-known spot for romance and wellness by the beach.'
) :-
    requirement(travel_style, romance),
    requirement(destination_type, beach).

% Rule 10: Luxury Skiing/Adventure
recommend_holiday(
    destination: swiss_alps,
    reason: 'High-end winter adventure focused on mountain activities.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    requirement(season, winter).

% ==============================================================================
% --- GROUP 2: BUDGET & RELAXATION RULES (11-20) ---
% ==============================================================================

% Rule 11: Budget Beach and Nightlife (Winter Escape)
recommend_holiday(
    destination: thailand,
    reason: 'Top choice for low-budget relaxation and active nightlife during winter.'
) :-
    requirement(destination_type, beach),
    requirement(budget, low),
    requirement(season, winter).

% Rule 12: Budget Culture/History (Winter)
recommend_holiday(
    destination: cairo,
    reason: 'Affordable, deep historical/cultural experience best in the milder winter months.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(budget, low),
    requirement(season, winter).

% Rule 13: Budget Relaxation Fallback (Year-round)
recommend_holiday(
    destination: bali,
    reason: 'Excellent value for money, year-round destination for relaxation and wellness.'
) :-
    requirement(activity, relaxation),
    requirement(budget, medium),
    requirement(destination_type, beach).

% Rule 14: Budget Solo Culture Trip
recommend_holiday(
    destination: kyoto,
    reason: 'Medium-budget, deep cultural experience in the shoulder seasons, great for solo reflection.'
) :-
    requirement(activity, culture),
    requirement(travel_style, solo),
    requirement(budget, medium),
    requirement(season, spring_autumn).

% Rule 15: Budget Adventure (Nature)
recommend_holiday(
    destination: costa_rica,
    reason: 'Medium-budget eco-tourism and adventure activities, usually in the summer.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    requirement(budget, medium).

% Rule 16: Budget City Break (General)
recommend_holiday(
    destination: london,
    reason: 'General-purpose city with a good balance of culture and cost (medium budget).'
) :-
    requirement(destination_type, city),
    requirement(budget, medium).

% Rule 17: Beach Relaxation (Summer Focus)
recommend_holiday(
    destination: greece,
    reason: 'Classic Mediterranean summer beach and relaxation spot.'
) :-
    requirement(destination_type, beach),
    requirement(season, summer),
    requirement(activity, relaxation).

% Rule 18: Budget & Active Nightlife
recommend_holiday(
    destination: thailand,
    reason: 'Go-to choice for budget travelers prioritizing nightlife.'
) :-
    requirement(budget, low),
    requirement(activity, partying).

% Rule 19: Medium Budget, Historical City
recommend_holiday(
    destination: rome,
    reason: 'Historical and family-friendly city, medium budget.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(travel_style, family).

% Rule 20: Medium Budget, Year-Round Beach (Fallback)
recommend_holiday(
    destination: bali,
    reason: 'Solid, medium-budget choice for beach time any time of year.'
) :-
    requirement(destination_type, beach),
    requirement(budget, medium).

% ==============================================================================
% --- GROUP 3: ADVENTURE & NATURE RULES (21-30) ---
% ==============================================================================

% Rule 21: High-Altitude Trekking (Solo/Adventure)
recommend_holiday(
    destination: machu_picchu,
    reason: 'Iconic historical and natural site best for solo travelers and serious hikers.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    requirement(travel_style, solo),
    requirement(season, summer). % Best to travel during dry season

% Rule 22: Eco-Tourism & Wildlife
recommend_holiday(
    destination: costa_rica,
    reason: 'Best in the world for eco-tourism and bio-diversity adventure.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    \+ requirement(budget, high).

% Rule 23: Adventure with Unique Scenery
recommend_holiday(
    destination: iceland,
    reason: 'Unique high-budget adventure focused on nature, great for groups or solos.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    requirement(budget, high).

% Rule 24: Extreme Winter Adventure
recommend_holiday(
    destination: swiss_alps,
    reason: 'Premium winter adventure destination for skiing and alpine sports.'
) :-
    requirement(destination_type, nature),
    requirement(activity, adventure),
    requirement(season, winter).

% Rule 25: Adventure with Historical Site
recommend_holiday(
    destination: machu_picchu,
    reason: 'Adventure and history combined for a unique, high-effort trip.'
) :-
    requirement(destination_type, nature),
    requirement(activity, culture),
    requirement(travel_style, solo).

% Rule 26: Trekking & Hiking (Long Term)
recommend_holiday(
    destination: patagonia,
    reason: 'Long-term, high-budget trekking and hiking destination.'
) :-
    requirement(activity, adventure),
    requirement(destination_type, nature),
    requirement(budget, high).

% Rule 27: Nature Fallback (Any Season)
recommend_holiday(
    destination: costa_rica,
    reason: 'Default nature/adventure recommendation with good year-round appeal.'
) :-
    requirement(destination_type, nature),
    \+ requirement(season, winter).

% Rule 28: Adventure and Group Travel
recommend_holiday(
    destination: iceland,
    reason: 'Adventure destination that is popular and easy to organize for large groups.'
) :-
    requirement(destination_type, nature),
    requirement(travel_style, group),
    requirement(activity, adventure).

% Rule 29: Nature with Focus on Relaxation
recommend_holiday(
    destination: bali, % Can be seen as both beach and nature
    reason: 'Nature destination with a heavy focus on relaxation and wellness.'
) :-
    requirement(destination_type, nature),
    requirement(activity, relaxation).

% Rule 30: Solo, High Adventure (Cooler Climate)
recommend_holiday(
    destination: patagonia,
    reason: 'Challenging solo adventure in a cooler, high-altitude region.'
) :-
    requirement(travel_style, solo),
    requirement(activity, adventure),
    requirement(season, summer). % Southern Hemisphere Summer

% ==============================================================================
% --- GROUP 4: CULTURE & CITY BREAK RULES (31-40) ---
% ==============================================================================

% Rule 31: Tech-Focused Culture Trip
recommend_holiday(
    destination: tokyo,
    reason: 'City break focused on technology, modern culture, and unique city life.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    \+ requirement(activity, history). % Implies modern/tech culture

% Rule 32: Deep Historical City Break (Budget)
recommend_holiday(
    destination: cairo,
    reason: 'Low-budget, intense historical and ancient cultural experience.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(budget, low).

% Rule 33: Zen & Traditional Culture (Romance)
recommend_holiday(
    destination: kyoto,
    reason: 'Refined culture, temples, and zen atmosphere, perfect for a romantic experience.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(travel_style, romance).

% Rule 34: Classic Western History & Family
recommend_holiday(
    destination: rome,
    reason: 'Iconic historical sights and classical culture, very family-friendly.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(travel_style, family).

% Rule 35: Theatre & General Culture
recommend_holiday(
    destination: london,
    reason: 'English-speaking city with a strong focus on museums, theatre, and pubs.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(budget, medium).

% Rule 36: Winter Culture (Opera/Classical)
recommend_holiday(
    destination: vienna,
    reason: 'Best experienced in the winter for opera, Christmas markets, and classical music.'
) :-
    requirement(destination_type, city),
    requirement(activity, culture),
    requirement(season, winter).

% Rule 37: City & Nightlife (High Energy)
recommend_holiday(
    destination: new_york,
    reason: 'High energy city with excellent nightlife and entertainment.'
) :-
    requirement(destination_type, city),
    requirement(activity, partying),
    requirement(travel_style, solo).

% Rule 38: City Culture Fallback (Medium Budget)
recommend_holiday(
    destination: london,
    reason: 'The safest, most accessible medium-budget city break for general culture.'
) :-
    requirement(destination_type, city),
    requirement(budget, medium),
    \+ requirement(travel_style, romance).

% Rule 39: Solo Traveler City
recommend_holiday(
    destination: new_york,
    reason: 'Easy and exciting city break for solo travelers.'
) :-
    requirement(destination_type, city),
    requirement(travel_style, solo).

% Rule 40: City & Group Travel
recommend_holiday(
    destination: tokyo,
    reason: 'A unique destination with excellent group travel infrastructure.'
) :-
    requirement(destination_type, city),
    requirement(travel_style, group).

% ==============================================================================
% --- GROUP 5: FALLBACK RULES (41-50) ---
% ==============================================================================

% Rule 41: General Fallback (Any Question Skipped)
recommend_holiday(
    destination: paris,
    reason: 'The most universally appealing, general-purpose city and romance destination.'
) :-
    \+ requirement(budget, high),
    \+ requirement(destination_type, beach),
    \+ requirement(destination_type, nature).

% Rule 42: High Budget, Any Type Fallback
recommend_holiday(
    destination: maui,
    reason: 'Default high-budget recommendation for luxury and all-around appeal.'
) :-
    requirement(budget, high).

% Rule 43: Family Travel Fallback (Beach)
recommend_holiday(
    destination: greece,
    reason: 'Safe and popular family destination focused on the beach and islands.'
) :-
    requirement(travel_style, family),
    requirement(destination_type, beach).

% Rule 44: Family Travel Fallback (City)
recommend_holiday(
    destination: london,
    reason: 'The most accessible, English-speaking city for family travel.'
) :-
    requirement(travel_style, family),
    requirement(destination_type, city).

% Rule 45: Winter Escape (Non-Skiing)
recommend_holiday(
    destination: thailand,
    reason: 'Best warm weather winter escape for relaxation and budget travelers.'
) :-
    requirement(season, winter),
    requirement(activity, relaxation).

% Rule 46: Best of Spring/Autumn (Culture)
recommend_holiday(
    destination: rome,
    reason: 'Iconic historical sites that are best visited outside of the extreme summer heat.'
) :-
    requirement(season, spring_autumn),
    requirement(activity, culture).

% Rule 47: Solo Traveler Fallback (Any Type)
recommend_holiday(
    destination: bali,
    reason: 'Popular and easy destination for solo travelers to relax or socialize.'
) :-
    requirement(travel_style, solo).

% Rule 48: Low Budget Fallback (Any Type)
recommend_holiday(
    destination: thailand,
    reason: 'The classic low-budget destination for backpackers and long-stay travelers.'
) :-
    requirement(budget, low).

% Rule 49: Group Travel Fallback (City)
recommend_holiday(
    destination: london,
    reason: 'Reliable, major city that is easy to manage for group travel.'
) :-
    requirement(travel_style, group),
    requirement(destination_type, city).

% Rule 50: Group Travel Fallback (Beach)
recommend_holiday(
    destination: greece,
    reason: 'Great social scene and reliable infrastructure for group beach trips.'
) :-
    requirement(travel_style, group),
    requirement(destination_type, beach).

% ==============================================================================
% HELPER PREDICATES (Cleaned - Removed 'Best Match' Logic)
% ==============================================================================
clear_requirements :-
    retractall(requirement(_, _)).

% Helper to print all matched stacks for the command line
print_all_stacks([]).
print_all_stacks([stack(D, R)|T]) :-
    format('- Destination: ~w, Reason: ~w~n', [D, R]),
    print_all_stacks(T).

% Query interface (for command-line testing)
ask_recommendation :-
    write('=== Holiday Advisor ==='), nl,
    write('Answer the following questions:'), nl, nl,
    
    % Collect requirements
    write('Destination type? (beach/city/nature): '),
    read(DestType),
    assert(requirement(destination_type, DestType)),
    
    write('Main activity? (relaxation/adventure/culture/partying): '),
    read(Activity),
    assert(requirement(activity, Activity)),
    
    write('Budget? (low/medium/high/very_high): '),
    read(Budget),
    assert(requirement(budget, Budget)),
    
    write('Season? (summer/winter/spring_autumn/year_round): '),
    read(Season),
    assert(requirement(season, Season)),
    
    write('Travel style? (family/solo/romance/group): '),
    read(Style),
    assert(requirement(travel_style, Style)),
    
    % Get recommendation (fetches all matching destinations)
    findall(
        stack(D, R),
        recommend_holiday(destination: D, reason: R),
        AllStacks
    ),
    
    nl,
    (AllStacks = [] ->
        write('No matching stack found. Consider custom configuration.')
    ;
        write('Matching Destinations (in rule order):'), nl,
        print_all_stacks(AllStacks)
    ),
    
    % Clean up
    retractall(requirement(_, _)).