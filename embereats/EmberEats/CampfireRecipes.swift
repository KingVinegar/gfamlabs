import Foundation

extension RecipeDatabase {
    static let campfireRecipes: [Recipe] = [
        // MARK: - Free Recipes

        Recipe(
            id: "campfire-hot-dogs",
            name: "Classic Campfire Hot Dogs",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 2,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "The simplest campfire meal there is. Skewer them or lay them on the grate. Either way works.",
            ingredients: [
                Ingredient(name: "hot dogs", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "hot dog buns", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "ketchup, mustard, relish", amount: "to taste", scalable: false, category: .pantry)
            ],
            equipment: ["roasting sticks or grill grate"],
            steps: [
                "Skewer hot dogs lengthwise on roasting sticks or lay them on the grate.",
                "Hold about 6 inches above medium coals, turning every minute or two.",
                "Cook 6-8 minutes until the skin splits and chars in spots.",
                "Nestle into buns and add toppings."
            ],
            proTip: "Score the hot dogs with shallow diagonal cuts before cooking. They heat more evenly and the char lines look great.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.familyFriendly, .quickMeals, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "campfire-scrambled-eggs",
            name: "Scrambled Eggs",
            cookingMethod: .campfire,
            mealType: .breakfast,
            prepTime: 5,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "A cast iron skillet over coals makes the best scrambled eggs. The trick is low heat and patience.",
            ingredients: [
                Ingredient(name: "eggs", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "butter", amount: "2 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "milk or water", amount: "2 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["cast iron skillet", "spatula"],
            steps: [
                "Beat eggs with milk, salt, and pepper in a bowl or jar.",
                "Set skillet on grate over low-medium coals.",
                "Melt butter and swirl to coat the pan.",
                "Pour in eggs and wait 30 seconds.",
                "Gently push eggs from edges to center with a spatula.",
                "Cook 5-6 minutes, folding occasionally, until just set but still moist.",
                "Remove from heat immediately. They keep cooking in the hot pan."
            ],
            proTip: "Crack eggs into a water bottle at home and keep it in the cooler. No shells to deal with at camp.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "campfire-smores",
            name: "Classic S'mores",
            cookingMethod: .campfire,
            mealType: .dessert,
            prepTime: 2,
            cookTime: 3,
            servings: 4,
            difficulty: .easy,
            introduction: "You already know how to make these. But there's a right way and a wrong way to toast a marshmallow.",
            ingredients: [
                Ingredient(name: "graham crackers", amount: "8 squares", scalable: true, category: .pantry),
                Ingredient(name: "marshmallows", amount: "4 large", scalable: true, category: .pantry),
                Ingredient(name: "chocolate bars", amount: "2", scalable: true, category: .pantry)
            ],
            equipment: ["roasting sticks"],
            steps: [
                "Break graham crackers in half. Place a piece of chocolate on one half.",
                "Skewer a marshmallow on a roasting stick.",
                "Hold marshmallow 6-8 inches above glowing coals, not in the flame.",
                "Rotate slowly for 2-3 minutes until golden brown all around.",
                "Sandwich the marshmallow between the chocolate-topped cracker and the plain cracker.",
                "Squeeze and pull out the stick. Wait 10 seconds for the chocolate to soften."
            ],
            proTip: "The best marshmallow comes from patience over coals, not flames. If it catches fire, you're too close.",
            safetyNote: "Marshmallows can drip hot sugar. Keep them away from skin and clothing.",
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .quickMeals, .ultralight, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "campfire-grilled-cheese",
            name: "Grilled Cheese",
            cookingMethod: .campfire,
            mealType: .lunch,
            prepTime: 5,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "Cast iron and campfire heat make the crispiest grilled cheese you'll ever have. Butter both sides generously.",
            ingredients: [
                Ingredient(name: "bread slices", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "cheddar cheese, sliced", amount: "8 slices", scalable: true, category: .dairy),
                Ingredient(name: "butter, softened", amount: "4 tablespoons", scalable: true, category: .dairy)
            ],
            equipment: ["cast iron skillet", "spatula"],
            steps: [
                "Butter one side of each bread slice generously.",
                "Place bread butter-side down in cold skillet.",
                "Layer cheese on top. Add second slice butter-side up.",
                "Set skillet on grate over medium coals.",
                "Cook 3-4 minutes until bottom is golden and crisp.",
                "Flip carefully and cook another 3-4 minutes.",
                "Remove when cheese is melted and both sides are golden."
            ],
            proTip: "Start with the skillet cold and heat it slowly with the sandwich in it. The cheese melts more evenly than dropping bread onto a hot pan.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot],
            isPremium: false
        ),

        Recipe(
            id: "campfire-cowboy-coffee",
            name: "Cowboy Coffee",
            cookingMethod: .campfire,
            mealType: .drink,
            prepTime: 2,
            cookTime: 10,
            servings: 4,
            difficulty: .easy,
            introduction: "No filter needed. Just a pot, water, and coffee grounds. Cowboys made it this way for a reason.",
            ingredients: [
                Ingredient(name: "coarsely ground coffee", amount: "1/2 cup", scalable: true, category: .drinks),
                Ingredient(name: "water", amount: "4 cups", scalable: true, category: .other),
                Ingredient(name: "cold water (for settling)", amount: "1/4 cup", scalable: false, category: .other)
            ],
            equipment: ["pot or percolator", "mugs"],
            steps: [
                "Bring water to a boil in the pot over high coals.",
                "Remove from heat and let it stop boiling.",
                "Add coffee grounds directly to the pot.",
                "Return to low coals and let steep 4-5 minutes. Do not boil.",
                "Remove from heat. Splash in cold water to settle the grounds.",
                "Wait 1 minute. Pour slowly into mugs, leaving the last inch in the pot."
            ],
            proTip: "Leftover coffee grounds scattered around your tent perimeter help keep ants away. Toss the rest into the fire.",
            safetyNote: nil,
            dietaryTags: [.vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.quickMeals, .onePot, .winterCamping, .ultralight, .bikepacking],
            isPremium: false
        ),

        Recipe(
            id: "campfire-corn-on-cob",
            name: "Fire-Roasted Corn on the Cob",
            cookingMethod: .campfire,
            mealType: .snack,
            prepTime: 5,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Husk on or husk off, both work. Husk on steams the corn. Husk off chars it. Pick your style.",
            ingredients: [
                Ingredient(name: "ears of corn, husks on", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "salt", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["grill grate", "tongs"],
            steps: [
                "Peel back husks but leave them attached. Remove the silk.",
                "Fold husks back over the corn.",
                "Soak in water for 10 minutes if you have time.",
                "Place on grate over medium coals.",
                "Turn every 3-4 minutes for 12-15 minutes.",
                "Husks will char and blacken. That's fine.",
                "Peel back husks, butter, salt, and eat."
            ],
            proTip: "If the husks are already removed, wrap each ear in foil with a pat of butter. Same result, less mess.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "campfire-baked-potatoes",
            name: "Ember-Baked Potatoes",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 45,
            servings: 4,
            difficulty: .easy,
            introduction: "Buried in coals, these come out with crispy skins and fluffy insides. Start them early because they take a while.",
            ingredients: [
                Ingredient(name: "russet potatoes", amount: "4 large", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1 tablespoon", scalable: false, category: .spices),
                Ingredient(name: "butter, sour cream, chives (toppings)", amount: "as desired", scalable: false, category: .dairy)
            ],
            equipment: ["heavy-duty aluminum foil", "tongs"],
            steps: [
                "Scrub potatoes clean and poke several times with a fork.",
                "Rub with oil and roll in salt.",
                "Wrap each potato tightly in a double layer of foil.",
                "Nestle directly into hot coals. Not flames, coals.",
                "Cook 40-50 minutes, turning once halfway through.",
                "Squeeze gently with tongs. They're done when they give easily.",
                "Unwrap carefully, split open, and load with toppings."
            ],
            proTip: "Wrap potatoes in foil at home and they're ready to toss in the fire when you arrive. One less thing to prep at camp.",
            safetyNote: "Use tongs and gloves when handling foil from coals. It retains heat longer than you expect.",
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .winterCamping],
            isPremium: false
        ),

        Recipe(
            id: "campfire-banana-boats",
            name: "Banana Boats",
            cookingMethod: .campfire,
            mealType: .dessert,
            prepTime: 5,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "Slit a banana, stuff it with chocolate and marshmallows, wrap in foil. The simplest campfire dessert after s'mores.",
            ingredients: [
                Ingredient(name: "bananas, unpeeled", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "chocolate chips", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "mini marshmallows", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "peanut butter (optional)", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: ["aluminum foil", "knife", "tongs"],
            steps: [
                "Leave the peel on. Slice each banana lengthwise, cutting through one side of the peel.",
                "Open the slit and stuff with chocolate chips and marshmallows.",
                "Add a drizzle of peanut butter if you brought it.",
                "Wrap each banana loosely in foil.",
                "Place on grate or in coals for 5-8 minutes.",
                "Unwrap and eat with a spoon directly from the peel."
            ],
            proTip: "Overripe bananas work better here. They're sweeter and softer, which means everything melts together faster.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree],
            tags: [.familyFriendly, .quickMeals, .campfireClassics],
            isPremium: false
        ),

        // MARK: - Premium Recipes

        Recipe(
            id: "campfire-skillet-steak",
            name: "Cast Iron Campfire Steak",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 12,
            servings: 4,
            difficulty: .medium,
            introduction: "A screaming hot cast iron over coals sears steak better than most home kitchens. Keep it simple: salt, pepper, butter.",
            ingredients: [
                Ingredient(name: "ribeye or strip steaks", amount: "4 (8 oz each)", scalable: true, category: .meat),
                Ingredient(name: "salt", amount: "2 teaspoons", scalable: true, category: .spices),
                Ingredient(name: "black pepper", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "garlic cloves, smashed", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "fresh rosemary sprigs (optional)", amount: "2", scalable: false, category: .other)
            ],
            equipment: ["cast iron skillet", "tongs", "meat thermometer"],
            steps: [
                "Pat steaks dry with a paper towel. Season generously with salt and pepper on both sides.",
                "Let steaks sit at cooler temperature for 20 minutes if possible.",
                "Set cast iron directly on hot coals. Let it heat until water drops sizzle immediately.",
                "Lay steaks in the dry pan. Do not move them for 4 minutes.",
                "Flip once. Add butter, garlic, and rosemary to the pan.",
                "Tilt the pan and spoon melted butter over the steaks for 3-4 minutes.",
                "Check temperature: 130 for medium-rare, 140 for medium.",
                "Rest 5 minutes before slicing. The temperature will rise 5 degrees while resting."
            ],
            proTip: "Salt your steaks at home in the morning and leave them uncovered in the cooler all day. The surface dries out, which means a better sear.",
            safetyNote: "Cast iron handles get extremely hot over coals. Always use a glove or thick towel.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.onePot, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "campfire-french-toast",
            name: "French Toast",
            cookingMethod: .campfire,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 12,
            servings: 4,
            difficulty: .easy,
            introduction: "Thick bread soaked in egg batter and crisped in butter over the fire. Use day-old bread if you have it.",
            ingredients: [
                Ingredient(name: "thick-cut bread", amount: "8 slices", scalable: true, category: .bread),
                Ingredient(name: "eggs", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "milk", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "cinnamon", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "vanilla extract", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "butter", amount: "3 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "maple syrup", amount: "for serving", scalable: false, category: .pantry)
            ],
            equipment: ["cast iron skillet or griddle", "shallow bowl", "spatula"],
            steps: [
                "Whisk eggs, milk, cinnamon, and vanilla in a shallow bowl.",
                "Set skillet on grate over medium coals. Melt butter.",
                "Dip each bread slice in the egg mixture for 5 seconds per side.",
                "Lay in the hot skillet. Don't crowd the pan.",
                "Cook 2-3 minutes per side until golden brown.",
                "Serve hot with maple syrup."
            ],
            proTip: "Mix the egg batter at home in a mason jar. At camp, just shake and pour into a bowl for dipping.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "campfire-sausage-peppers",
            name: "Skillet Sausage and Peppers",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Italian sausages with charred peppers and onions. Serve on rolls or eat straight from the skillet.",
            ingredients: [
                Ingredient(name: "Italian sausages", amount: "4 links", scalable: true, category: .meat),
                Ingredient(name: "bell peppers, sliced", amount: "3 (mixed colors)", scalable: true, category: .produce),
                Ingredient(name: "onion, sliced into rings", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "hoagie rolls (optional)", amount: "4", scalable: true, category: .bread)
            ],
            equipment: ["cast iron skillet", "tongs"],
            steps: [
                "Set skillet on grate over medium-high coals.",
                "Add oil and sausages. Brown on all sides, about 8 minutes.",
                "Move sausages to one side. Add peppers and onions.",
                "Cook vegetables 8-10 minutes, stirring occasionally, until softened and charred.",
                "Push everything together and cook 2 more minutes.",
                "Serve sausages on rolls topped with peppers and onions."
            ],
            proTip: "Poke sausages a few times with a fork before cooking. Lets the fat render out and the casing gets crispier.",
            safetyNote: "Cut into the thickest sausage to check it's cooked through. Pink inside means more time.",
            dietaryTags: [.nutFree, .dairyFree],
            tags: [.familyFriendly, .onePot],
            isPremium: false
        ),

        Recipe(
            id: "campfire-fajitas",
            name: "Chicken Fajitas",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Sizzling chicken and peppers in a cast iron. Wrap them in tortillas with whatever toppings you packed.",
            ingredients: [
                Ingredient(name: "chicken breasts, sliced into strips", amount: "1.5 lbs", scalable: true, category: .meat),
                Ingredient(name: "bell peppers, sliced", amount: "3 (mixed colors)", scalable: true, category: .produce),
                Ingredient(name: "onion, sliced", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "lime juice", amount: "2 tablespoons", scalable: false, category: .produce),
                Ingredient(name: "chili powder", amount: "2 teaspoons", scalable: false, category: .spices),
                Ingredient(name: "cumin", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "flour tortillas", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "sour cream, salsa, cheese", amount: "for topping", scalable: false, category: .dairy)
            ],
            equipment: ["cast iron skillet", "tongs"],
            steps: [
                "Toss chicken with 2 tablespoons oil, lime juice, chili powder, cumin, garlic powder, salt, and pepper.",
                "Set skillet on grate over high coals.",
                "Cook chicken 6-7 minutes, stirring occasionally, until cooked through.",
                "Remove chicken and set aside.",
                "Add remaining oil, peppers, and onion to the skillet.",
                "Cook 5-6 minutes until softened and lightly charred.",
                "Return chicken to skillet and toss everything together.",
                "Warm tortillas on the grate edge for 15 seconds per side.",
                "Serve fajita mix in tortillas with toppings."
            ],
            proTip: "Slice chicken and vegetables at home. Pack them separately in zip-lock bags and they're ready to dump in the skillet.",
            safetyNote: "Wash hands, cutting board, and knife with soap after handling raw chicken.",
            dietaryTags: [.nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "campfire-pancakes",
            name: "Griddle Pancakes",
            cookingMethod: .campfire,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .medium,
            introduction: "A flat cast iron or griddle over coals makes good pancakes. The trick is managing the heat.",
            ingredients: [
                Ingredient(name: "pancake mix", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "water or milk", amount: "1.5 cups", scalable: true, category: .other),
                Ingredient(name: "egg", amount: "1", scalable: true, category: .meat),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "butter (for griddle)", amount: "2 tablespoons", scalable: false, category: .dairy),
                Ingredient(name: "maple syrup", amount: "for serving", scalable: false, category: .pantry)
            ],
            equipment: ["cast iron skillet or griddle", "spatula", "bowl", "ladle"],
            steps: [
                "Mix pancake mix, water, egg, and oil in a bowl until just combined. Lumps are fine.",
                "Set skillet on grate over low-medium coals. You want steady, even heat.",
                "Melt a pat of butter and swirl to coat.",
                "Pour about 1/4 cup batter per pancake.",
                "Cook until bubbles form on the surface and edges look dry, about 2-3 minutes.",
                "Flip and cook 1-2 more minutes until golden.",
                "Keep cooked pancakes warm in foil near the fire while you make the rest."
            ],
            proTip: "Pre-mix the dry ingredients at home in a zip-lock bag. Write the wet ingredients to add right on the bag with a sharpie.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: false
        ),

        Recipe(
            id: "campfire-nachos",
            name: "Skillet Campfire Nachos",
            cookingMethod: .campfire,
            mealType: .snack,
            prepTime: 10,
            cookTime: 10,
            servings: 4,
            difficulty: .easy,
            introduction: "Layer chips and cheese in a skillet, cover, and let the fire do the work. Good for snacking or a quick meal.",
            ingredients: [
                Ingredient(name: "tortilla chips", amount: "1 large bag", scalable: true, category: .pantry),
                Ingredient(name: "shredded cheese", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "black beans, drained", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "salsa", amount: "1 cup", scalable: false, category: .pantry),
                Ingredient(name: "sour cream", amount: "1/2 cup", scalable: false, category: .dairy),
                Ingredient(name: "jalapenos, sliced (optional)", amount: "to taste", scalable: false, category: .produce)
            ],
            equipment: ["cast iron skillet with lid", "serving spoon"],
            steps: [
                "Spread half the chips in the skillet.",
                "Sprinkle with half the cheese and half the beans.",
                "Add remaining chips, cheese, and beans.",
                "Cover with lid and set on grate over medium coals.",
                "Cook 8-10 minutes until cheese is fully melted.",
                "Remove from heat. Top with salsa, sour cream, and jalapenos.",
                "Serve directly from the skillet."
            ],
            proTip: "Line the skillet with foil before layering chips. Makes cleanup painless and nothing sticks.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "campfire-bbq-chicken",
            name: "BBQ Chicken Quarters",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 35,
            servings: 4,
            difficulty: .medium,
            introduction: "Bone-in chicken over coals with BBQ sauce brushed on at the end. Patience here pays off.",
            ingredients: [
                Ingredient(name: "chicken leg quarters", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "salt", amount: "1 tablespoon", scalable: false, category: .spices),
                Ingredient(name: "black pepper", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "BBQ sauce", amount: "1 cup", scalable: false, category: .pantry)
            ],
            equipment: ["grill grate", "tongs", "basting brush"],
            steps: [
                "Season chicken all over with salt, pepper, and garlic powder.",
                "Set grate over medium coals, about 8 inches above.",
                "Place chicken skin-side up. Cook 15 minutes.",
                "Flip to skin-side down. Cook 10 minutes.",
                "Flip again and brush generously with BBQ sauce.",
                "Cook 5-8 more minutes, turning and basting, until juices run clear.",
                "Rest 5 minutes before eating."
            ],
            proTip: "Only sauce the chicken in the last 10 minutes. Sugar in the sauce burns fast over open flame.",
            safetyNote: "Check that juices run clear when you cut into the thickest part near the bone. Pink means it needs more time.",
            dietaryTags: [.glutenFree, .nutFree, .dairyFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "campfire-burgers",
            name: "Smash Burgers",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "Roll beef into loose balls and smash them flat on a screaming hot skillet. The crust is what makes these special.",
            ingredients: [
                Ingredient(name: "ground beef (80/20)", amount: "1.5 lbs", scalable: true, category: .meat),
                Ingredient(name: "salt", amount: "2 teaspoons", scalable: false, category: .spices),
                Ingredient(name: "pepper", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "American cheese slices", amount: "4", scalable: true, category: .dairy),
                Ingredient(name: "burger buns", amount: "4", scalable: true, category: .bread),
                Ingredient(name: "lettuce, tomato, onion, pickles", amount: "as desired", scalable: false, category: .produce)
            ],
            equipment: ["cast iron skillet", "sturdy spatula"],
            steps: [
                "Divide beef into 4 loose balls. Do not pack them tight.",
                "Set cast iron directly on hot coals. Let it get screaming hot.",
                "Place a ball on the skillet and immediately press flat with the spatula. Season with salt and pepper.",
                "Cook 2-3 minutes without moving until a dark crust forms.",
                "Flip, add a cheese slice on top, and cook 2 more minutes.",
                "Toast buns cut-side down on the grate for 30 seconds.",
                "Assemble with toppings."
            ],
            proTip: "Keep the beef cold until the moment it hits the pan. Cold meat on a hot pan equals the best crust.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "campfire-foil-fish",
            name: "Lemon Herb Fish",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .medium,
            introduction: "White fish in foil packets with lemon and herbs. Works with whatever fresh catch or store-bought fillets you have.",
            ingredients: [
                Ingredient(name: "white fish fillets (tilapia, cod, or trout)", amount: "4 (6 oz each)", scalable: true, category: .meat),
                Ingredient(name: "lemon, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "garlic, minced", amount: "2 cloves", scalable: false, category: .produce),
                Ingredient(name: "fresh dill or parsley", amount: "2 tablespoons", scalable: false, category: .other),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "butter", amount: "2 tablespoons", scalable: true, category: .dairy)
            ],
            equipment: ["heavy-duty aluminum foil", "tongs"],
            steps: [
                "Tear four large sheets of foil.",
                "Place a fillet on each sheet. Drizzle with oil.",
                "Season with salt, pepper, and garlic.",
                "Top each fillet with lemon slices, herbs, and a pat of butter.",
                "Fold foil over and crimp edges tightly.",
                "Place on grate over medium coals.",
                "Cook 12-15 minutes. Fish is done when it flakes easily with a fork."
            ],
            proTip: "If you caught the fish that morning, keep it on ice until cooking. Fresh fish and campfire smoke is a combination that's hard to beat.",
            safetyNote: "Open foil packets carefully and away from your face. The steam is very hot.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "campfire-bacon-eggs",
            name: "Bacon and Eggs Over Fire",
            cookingMethod: .campfire,
            mealType: .breakfast,
            prepTime: 5,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Cook the bacon first, then fry the eggs in the bacon fat. This is camping breakfast done right.",
            ingredients: [
                Ingredient(name: "thick-cut bacon", amount: "8 strips", scalable: true, category: .meat),
                Ingredient(name: "eggs", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "bread for toast (optional)", amount: "4 slices", scalable: true, category: .bread)
            ],
            equipment: ["cast iron skillet", "spatula", "tongs"],
            steps: [
                "Set skillet on grate over medium coals.",
                "Lay bacon strips in the cold skillet and let them heat up together.",
                "Cook bacon 8-10 minutes, flipping once, until crispy. Remove and drain on paper towel.",
                "Pour off all but 2 tablespoons of bacon fat. Save the rest in a tin.",
                "Crack eggs directly into the hot bacon fat.",
                "Cook 3-4 minutes for sunny side up. Spoon hot fat over the whites to set them.",
                "Season with salt and pepper. Serve with bacon and toast."
            ],
            proTip: "Save bacon grease in a small tin. It's the best fire starter you'll ever use, and it makes everything taste better.",
            safetyNote: "Bacon fat pops. Stand to the side when flipping and keep the skillet handle turned away from the fire.",
            dietaryTags: [.glutenFree, .nutFree, .dairyFree],
            tags: [.familyFriendly, .quickMeals, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "campfire-hobo-packets",
            name: "Hobo Dinner Packets",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 30,
            servings: 4,
            difficulty: .easy,
            introduction: "Ground beef, potatoes, and vegetables wrapped in foil. Everything cooks together and cleanup is nothing.",
            ingredients: [
                Ingredient(name: "ground beef", amount: "1.5 lbs", scalable: true, category: .meat),
                Ingredient(name: "potatoes, thinly sliced", amount: "3 medium", scalable: true, category: .produce),
                Ingredient(name: "carrots, thinly sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "onion, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "Worcestershire sauce", amount: "1 tablespoon", scalable: false, category: .pantry)
            ],
            equipment: ["heavy-duty aluminum foil", "tongs"],
            steps: [
                "Cut four large squares of heavy-duty foil.",
                "Divide potatoes, carrots, and onion among the four squares.",
                "Top each pile with a portion of ground beef.",
                "Add a pat of butter and season with salt, pepper, and Worcestershire.",
                "Fold foil over and crimp edges tightly to seal.",
                "Place on grate over medium coals.",
                "Cook 25-30 minutes, flipping once halfway through.",
                "Open carefully and check that beef is cooked through."
            ],
            proTip: "Write each person's name on their foil packet with a rock before cooking. Everyone gets theirs and you avoid the guessing game.",
            safetyNote: "Steam inside the packets is extremely hot. Open slowly and away from your face.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly, .winterCamping, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "campfire-hash-browns",
            name: "Crispy Campfire Hash Browns",
            cookingMethod: .campfire,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .medium,
            introduction: "Shredded potatoes pressed into a hot skillet and left alone until they form a golden crust. Takes patience but worth it.",
            ingredients: [
                Ingredient(name: "potatoes, peeled and shredded", amount: "4 medium", scalable: true, category: .produce),
                Ingredient(name: "butter or bacon fat", amount: "3 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "salt", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "pepper", amount: "1/2 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "onion, finely diced (optional)", amount: "1/2", scalable: true, category: .produce)
            ],
            equipment: ["cast iron skillet", "spatula", "paper towels"],
            steps: [
                "Squeeze shredded potatoes in a towel to remove as much moisture as possible.",
                "Set skillet on grate over medium coals. Melt butter.",
                "Spread potatoes evenly in the skillet. Press down firmly with the spatula.",
                "Season with salt and pepper. Add onion if using.",
                "Cook without moving for 8-10 minutes until the bottom is dark golden.",
                "Flip in sections and press down again.",
                "Cook 8-10 more minutes until crispy on both sides."
            ],
            proTip: "Use a box grater at home and pack the shredded potatoes in water to keep them from browning. Drain and squeeze dry at camp.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "campfire-roasted-vegetables",
            name: "Fire-Roasted Vegetable Medley",
            cookingMethod: .campfire,
            mealType: .snack,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Charred vegetables with smoky flavor. Use whatever you have in the cooler.",
            ingredients: [
                Ingredient(name: "zucchini, sliced thick", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "bell pepper, cut into chunks", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "red onion, cut into wedges", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "mushrooms, halved", amount: "8 oz", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "3 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["grill grate or grill basket", "tongs", "bowl"],
            steps: [
                "Toss vegetables in a bowl with oil, garlic powder, salt, and pepper.",
                "Spread on the grate or in a grill basket over medium-high coals.",
                "Cook 15-20 minutes, turning occasionally, until tender with good char marks.",
                "Serve hot as a side or eat straight off the grate."
            ],
            proTip: "Cut vegetables at home and store in a container. Toss with oil and seasoning at camp when you're ready to cook.",
            safetyNote: nil,
            dietaryTags: [.vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "campfire-hot-chocolate",
            name: "Hot Chocolate",
            cookingMethod: .campfire,
            mealType: .drink,
            prepTime: 5,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "Rich, creamy, and perfect for cold nights. Make it as sweet as you want.",
            ingredients: [
                Ingredient(name: "milk", amount: "4 cups", scalable: true, category: .dairy),
                Ingredient(name: "cocoa powder", amount: "1/4 cup", scalable: true, category: .drinks),
                Ingredient(name: "sugar", amount: "1/4 cup", scalable: true, category: .pantry),
                Ingredient(name: "vanilla extract", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "marshmallows (optional)", amount: "for topping", scalable: false, category: .pantry)
            ],
            equipment: ["pot", "whisk or spoon", "mugs"],
            steps: [
                "Heat milk in pot over medium coals until steaming but not boiling.",
                "Whisk in cocoa powder and sugar until dissolved.",
                "Stir in vanilla.",
                "Simmer 2-3 minutes, stirring occasionally.",
                "Pour into mugs and top with marshmallows."
            ],
            proTip: "Mix cocoa powder and sugar at home in a small container. At camp, just heat milk and stir in the mix.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot, .winterCamping, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "campfire-trail-cookies",
            name: "Skillet Trail Mix Cookies",
            cookingMethod: .campfire,
            mealType: .dessert,
            prepTime: 10,
            cookTime: 15,
            servings: 8,
            difficulty: .medium,
            introduction: "One big cookie baked in a cast iron skillet. Cut it into wedges like a pie. Better than anything from a bakery.",
            ingredients: [
                Ingredient(name: "butter, softened", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "brown sugar", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "egg", amount: "1", scalable: true, category: .meat),
                Ingredient(name: "vanilla extract", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "flour", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "baking soda", amount: "1/2 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1/4 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "chocolate chips", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "chopped nuts", amount: "1/4 cup", scalable: true, category: .other),
                Ingredient(name: "dried cranberries", amount: "1/4 cup", scalable: true, category: .pantry)
            ],
            equipment: ["cast iron skillet with lid", "bowl", "spoon"],
            steps: [
                "Mix butter and brown sugar in a bowl until combined.",
                "Stir in egg and vanilla.",
                "Add flour, baking soda, and salt. Mix until just combined.",
                "Fold in chocolate chips, nuts, and cranberries.",
                "Press dough evenly into a greased cast iron skillet.",
                "Cover with lid. Set on grate over low coals.",
                "Place a few coals on top of the lid.",
                "Bake 12-15 minutes until edges are golden and center is just set.",
                "Let cool 10 minutes. Cut into wedges."
            ],
            proTip: "Mix the dry ingredients at home in a bag. At camp, just melt butter, add egg and vanilla, then dump in the dry mix. Cuts prep time in half.",
            safetyNote: nil,
            dietaryTags: [.vegetarian],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "campfire-stuffed-peppers",
            name: "Stuffed Peppers",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 25,
            servings: 4,
            difficulty: .medium,
            introduction: "Bell peppers filled with seasoned rice and beef, cooked right in the coals. Wrap them in foil and forget about them for a while.",
            ingredients: [
                Ingredient(name: "bell peppers", amount: "4 large", scalable: true, category: .produce),
                Ingredient(name: "ground beef", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "cooked rice", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "shredded cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "diced tomatoes", amount: "1/2 cup", scalable: true, category: .produce),
                Ingredient(name: "salt, pepper, garlic powder", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["heavy-duty aluminum foil", "bowl", "tongs"],
            steps: [
                "Cut the tops off peppers and remove seeds.",
                "Brown ground beef in a skillet. Drain fat.",
                "Mix beef with rice, half the cheese, tomatoes, and seasonings.",
                "Stuff each pepper with the mixture. Top with remaining cheese.",
                "Wrap each pepper tightly in foil.",
                "Nestle in medium coals.",
                "Cook 20-25 minutes until peppers are tender.",
                "Unwrap carefully and serve."
            ],
            proTip: "Cook the rice and brown the beef at home. At camp, just mix, stuff, wrap, and cook. Makes this a 5-minute prep meal.",
            safetyNote: "Use tongs to handle foil packets from the coals. Let them cool a minute before unwrapping.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "campfire-chicken-skewers",
            name: "Chicken Skewers",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 20,
            cookTime: 12,
            servings: 4,
            difficulty: .medium,
            introduction: "Marinated chicken chunks on skewers over the fire. Alternate with vegetables for a full meal on a stick.",
            ingredients: [
                Ingredient(name: "chicken breast, cubed", amount: "1.5 lbs", scalable: true, category: .meat),
                Ingredient(name: "bell peppers, cut into chunks", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "red onion, cut into chunks", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "zucchini, sliced thick", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "lemon juice", amount: "2 tablespoons", scalable: false, category: .produce),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "paprika", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["metal skewers or soaked wooden skewers", "grill grate"],
            steps: [
                "Toss chicken with oil, lemon juice, garlic powder, paprika, salt, and pepper.",
                "Thread chicken and vegetables alternately onto skewers.",
                "Set grate about 6 inches above medium coals.",
                "Place skewers on the grate.",
                "Cook 10-12 minutes total, turning every 3 minutes.",
                "Chicken is done when firm and no longer pink inside."
            ],
            proTip: "If using wooden skewers, soak them in water for 30 minutes before threading. Otherwise they catch fire.",
            safetyNote: "Ensure chicken reaches 165 degrees internally. Cut into the thickest piece to check.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "campfire-pita-pizza",
            name: "Pita Pizzas",
            cookingMethod: .campfire,
            mealType: .lunch,
            prepTime: 5,
            cookTime: 5,
            servings: 4,
            difficulty: .easy,
            introduction: "Pita bread topped with sauce and cheese, crisped over the fire. Everyone makes their own.",
            ingredients: [
                Ingredient(name: "pita bread rounds", amount: "4", scalable: true, category: .bread),
                Ingredient(name: "pizza sauce or tomato sauce", amount: "1/2 cup", scalable: true, category: .canned),
                Ingredient(name: "shredded mozzarella", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "pepperoni (optional)", amount: "as desired", scalable: false, category: .meat),
                Ingredient(name: "any other pizza toppings", amount: "as desired", scalable: false, category: .other)
            ],
            equipment: ["grill grate or cast iron skillet with lid", "spatula"],
            steps: [
                "Spread sauce on each pita.",
                "Top with cheese and desired toppings.",
                "Place on grate over low-medium coals or in a covered skillet.",
                "Cook 4-5 minutes until cheese melts and pita bottom is crispy.",
                "Slide off with a spatula."
            ],
            proTip: "Bring the sauce in a squeeze bottle to skip the spoon. Toppings in individual bags let everyone customize.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .quickMeals],
            isPremium: true
        ),

        Recipe(
            id: "campfire-fried-trout",
            name: "Pan-Fried Campfire Trout",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 10,
            servings: 4,
            difficulty: .medium,
            introduction: "If you caught it, this is the way to cook it. Simple seasoned flour and butter in a hot skillet.",
            ingredients: [
                Ingredient(name: "whole trout, cleaned", amount: "4 small", scalable: true, category: .meat),
                Ingredient(name: "flour", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "salt", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "pepper", amount: "1/2 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "paprika", amount: "1/2 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "lemon wedges", amount: "for serving", scalable: false, category: .produce)
            ],
            equipment: ["cast iron skillet", "tongs", "plate"],
            steps: [
                "Mix flour, salt, pepper, and paprika on a plate.",
                "Pat trout dry inside and out. Dredge in seasoned flour.",
                "Set skillet on grate over medium-high coals. Melt butter.",
                "Lay trout in the hot butter.",
                "Cook 4-5 minutes per side until golden and the flesh flakes easily.",
                "Serve with lemon wedges."
            ],
            proTip: "Rub the outside of your cast iron with dish soap before placing it over the fire. The soot wipes right off after cooking.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.quickMeals, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "campfire-dutch-baby",
            name: "Dutch Baby Pancake",
            cookingMethod: .campfire,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .medium,
            introduction: "A puffy, custardy oven pancake made in cast iron over the fire. It puffs up dramatically and deflates as it cools.",
            ingredients: [
                Ingredient(name: "eggs", amount: "3", scalable: true, category: .meat),
                Ingredient(name: "flour", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "milk", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "sugar", amount: "1 tablespoon", scalable: false, category: .pantry),
                Ingredient(name: "vanilla extract", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "butter", amount: "3 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "lemon juice and powdered sugar (for serving)", amount: "to taste", scalable: false, category: .pantry)
            ],
            equipment: ["cast iron skillet with lid", "bowl", "whisk"],
            steps: [
                "Whisk eggs, flour, milk, sugar, and vanilla until smooth.",
                "Set skillet on grate over medium coals. Melt butter and swirl to coat.",
                "Pour batter into the hot skillet.",
                "Cover with lid. Place a few coals on top.",
                "Cook 12-15 minutes until puffed and golden.",
                "Remove lid. Squeeze lemon juice over the top and dust with powdered sugar.",
                "Cut into wedges and serve immediately."
            ],
            proTip: "The batter needs to hit a hot, buttery pan to puff properly. Don't pour it in until the butter is sizzling.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "campfire-popcorn",
            name: "Popcorn",
            cookingMethod: .campfire,
            mealType: .snack,
            prepTime: 2,
            cookTime: 5,
            servings: 4,
            difficulty: .easy,
            introduction: "Popcorn popped in foil over the fire. The sound of kernels popping around the campfire is half the experience.",
            ingredients: [
                Ingredient(name: "popcorn kernels", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "butter, melted", amount: "3 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "salt", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["heavy-duty aluminum foil", "long stick or tongs"],
            steps: [
                "Tear off a large sheet of heavy-duty foil, about 18 inches long.",
                "Place popcorn kernels and oil in the center of the foil.",
                "Bring the corners together and twist the top to seal, leaving plenty of room for the kernels to expand.",
                "Poke a few tiny holes near the top for steam to escape.",
                "Hold the pouch by the twisted top over medium coals using a stick or tongs. Keep it about 6 inches above the coals.",
                "Shake gently and constantly. Popping will start in 1-2 minutes.",
                "When popping slows to 2-3 seconds between pops, remove from heat.",
                "Open carefully, drizzle with melted butter, and season with salt."
            ],
            proTip: "Make two small pouches instead of one big one. Smaller batches pop more evenly and you won't end up with a pile of unpopped kernels at the bottom.",
            safetyNote: "The foil pouch gets very hot. Use a stick or tongs and set it on a plate to cool for 30 seconds before opening.",
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "campfire-mountain-pies",
            name: "Mountain Pies",
            cookingMethod: .campfire,
            mealType: .lunch,
            prepTime: 5,
            cookTime: 5,
            servings: 4,
            difficulty: .easy,
            introduction: "Buttered bread pressed in a pie iron with whatever filling you want. The edges seal and crisp up into a perfect pocket.",
            ingredients: [
                Ingredient(name: "bread slices", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "butter, softened", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "pizza sauce", amount: "1/2 cup", scalable: true, category: .canned),
                Ingredient(name: "shredded mozzarella", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "pepperoni slices", amount: "24", scalable: true, category: .meat)
            ],
            equipment: ["pie iron (pudgy pie maker)"],
            steps: [
                "Butter one side of each bread slice.",
                "Place one slice butter-side-down in one half of the pie iron.",
                "Spread pizza sauce on the bread. Add cheese and pepperoni.",
                "Top with the second bread slice, butter-side-up.",
                "Close the pie iron and trim any overhanging bread.",
                "Hold over medium coals for 2-3 minutes per side until golden brown and crispy.",
                "Open carefully. The filling will be very hot. Let cool for a minute."
            ],
            proTip: "Season the pie iron like a cast iron skillet before your first use. Rub with oil and heat over coals for 10 minutes. Nothing will stick after that.",
            safetyNote: "The filling gets extremely hot. Let mountain pies cool for at least a minute before biting in.",
            dietaryTags: [.nutFree],
            tags: [.familyFriendly, .quickMeals, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "campfire-breadtwists",
            name: "Bread on a Stick",
            cookingMethod: .campfire,
            mealType: .snack,
            prepTime: 10,
            cookTime: 10,
            servings: 4,
            difficulty: .easy,
            introduction: "Wrap dough around a green stick and roast it over the fire. Pull it off and fill the hole with butter or jam.",
            ingredients: [
                Ingredient(name: "refrigerated biscuit dough", amount: "1 can (8 biscuits)", scalable: true, category: .other),
                Ingredient(name: "butter, melted", amount: "3 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "cinnamon sugar", amount: "3 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "honey or jam (optional)", amount: "for filling", scalable: false, category: .pantry)
            ],
            equipment: ["thick green sticks or roasting forks"],
            steps: [
                "Find a thick green stick about 1 inch in diameter. Peel the bark off the end.",
                "Take one biscuit and roll it into a long rope about 12 inches long.",
                "Wrap the dough rope in a spiral around the stick, pinching the ends to seal.",
                "Hold over medium coals, rotating slowly, for 8-10 minutes.",
                "The bread is done when golden brown all around and it sounds hollow when tapped.",
                "Slide the bread off the stick. Brush with melted butter and roll in cinnamon sugar.",
                "Fill the hollow center with honey or jam if desired."
            ],
            proTip: "Use a green stick, not a dead one. Dead wood dries out and can catch fire or snap. Green wood steams slightly and helps the bread release.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "campfire-caramel-apples",
            name: "Caramel Apples",
            cookingMethod: .campfire,
            mealType: .dessert,
            prepTime: 5,
            cookTime: 3,
            servings: 4,
            difficulty: .easy,
            introduction: "Roast apple slices on a stick and dip them in warm caramel. Simple fall dessert that beats anything from a candy shop.",
            ingredients: [
                Ingredient(name: "apples, cored and cut into thick wedges", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "caramel candies or caramel sauce", amount: "1 bag (11 oz) or 1 cup", scalable: true, category: .pantry),
                Ingredient(name: "water", amount: "2 tablespoons", scalable: false, category: .other),
                Ingredient(name: "cinnamon", amount: "1/2 teaspoon", scalable: false, category: .spices)
            ],
            equipment: ["roasting sticks or skewers", "small pot or tin can"],
            steps: [
                "Skewer apple wedges on roasting sticks.",
                "Hold apples over medium coals for 2-3 minutes, turning occasionally, until warm and slightly softened.",
                "While apples roast, melt caramel candies with water in a small pot at the edge of the fire, stirring until smooth.",
                "Stir cinnamon into the melted caramel.",
                "Dip warm apple wedges into the caramel.",
                "Let cool for 30 seconds before eating."
            ],
            proTip: "Tart apples like Granny Smith work best. The sourness balances the sweetness of the caramel. Honeycrisp is a close second.",
            safetyNote: "Melted caramel is extremely hot and sticky. Keep it away from small children and let it cool before dipping.",
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "campfire-baked-beans",
            name: "Baked Beans",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 25,
            servings: 6,
            difficulty: .easy,
            introduction: "Canned beans doctored up with bacon, brown sugar, and mustard. A campfire side dish that steals the show.",
            ingredients: [
                Ingredient(name: "canned baked beans", amount: "2 cans (28 oz each)", scalable: true, category: .canned),
                Ingredient(name: "bacon, diced", amount: "4 slices", scalable: true, category: .meat),
                Ingredient(name: "onion, diced", amount: "1 small", scalable: true, category: .produce),
                Ingredient(name: "brown sugar", amount: "1/4 cup", scalable: true, category: .pantry),
                Ingredient(name: "yellow mustard", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "Worcestershire sauce", amount: "1 tablespoon", scalable: false, category: .pantry)
            ],
            equipment: ["cast iron skillet or pot", "wooden spoon"],
            steps: [
                "Set skillet on grate over medium coals.",
                "Cook diced bacon until crispy, about 5 minutes.",
                "Add diced onion and cook 2-3 minutes until softened.",
                "Pour in baked beans. Stir in brown sugar, mustard, and Worcestershire sauce.",
                "Simmer on low heat for 15-20 minutes, stirring occasionally, until thick and bubbly.",
                "Move to the edge of the fire to keep warm until serving."
            ],
            proTip: "Start these before the main course. They need time to simmer and thicken, and they'll stay warm at the edge of the fire for as long as you need.",
            safetyNote: nil,
            dietaryTags: [.glutenFree, .nutFree, .dairyFree],
            tags: [.familyFriendly, .onePot, .winterCamping, .campfireClassics],
            isPremium: false
        )
    ]
}
