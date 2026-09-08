import Foundation

extension RecipeDatabase {
    static let foilPacketRecipes: [Recipe] = [
        // MARK: - Free Recipes (7)

        Recipe(
            id: "foil-packet-fajitas",
            name: "Fajitas",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Everything cooks together in one packet. No pan to scrub, and the chicken stays juicy.",
            ingredients: [
                Ingredient(name: "chicken breast, sliced thin", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "bell peppers, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "onion, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "fajita seasoning", amount: "2 tablespoons", scalable: true, category: .spices),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "tortillas", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "lime", amount: "1", scalable: false, category: .produce)
            ],
            equipment: [
                "Heavy-duty aluminum foil",
                "Tongs"
            ],
            steps: [
                "Tear off a 2-foot piece of heavy-duty foil and fold in half to double it.",
                "Place chicken, peppers, and onions in the center. Sprinkle with fajita seasoning and drizzle with oil.",
                "Fold foil edges together and crimp to seal, leaving room for steam inside.",
                "Place packet on hot coals or grill grate. Cook 20 minutes, flipping once halfway through.",
                "Open carefully to release steam. Check that chicken is cooked through.",
                "Serve with tortillas and lime wedges."
            ],
            proTip: "Use heavy-duty foil or double-wrap with regular foil. A single layer tears too easily on the grill.",
            safetyNote: "Make sure chicken reaches 165F internal temperature. If unsure, tear open the thickest piece to check.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "foil-packet-breakfast-hash",
            name: "Breakfast Hash",
            cookingMethod: .foilPacket,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 25,
            servings: 4,
            difficulty: .easy,
            introduction: "Classic camp breakfast that cooks while you're breaking down the tent. Everything you need in one packet.",
            ingredients: [
                Ingredient(name: "frozen hash browns", amount: "4 cups", scalable: true, category: .pantry),
                Ingredient(name: "breakfast sausage, crumbled", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "bell pepper, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "onion, diced", amount: "1 small", scalable: true, category: .produce),
                Ingredient(name: "shredded cheddar", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "butter", amount: "2 tablespoons", scalable: true, category: .dairy)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Double-layer two sheets of heavy-duty foil.",
                "Spread hash browns in the center. Top with sausage, peppers, and onions.",
                "Dot with butter and season with salt and pepper.",
                "Seal packet tightly, leaving air space inside for steam.",
                "Place on hot coals for 20-25 minutes, flipping every 8 minutes.",
                "Open carefully and top with cheese. Reseal for 2 minutes to melt."
            ],
            proTip: "Frozen hash browns work better than fresh potatoes. They're already par-cooked and won't turn brown in your cooler.",
            safetyNote: nil,
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly, .winterCamping],
            isPremium: false
        ),

        Recipe(
            id: "foil-packet-garlic-butter-shrimp",
            name: "Garlic Butter Shrimp",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 12,
            servings: 4,
            difficulty: .easy,
            introduction: "Quick-cooking shrimp works perfectly in foil. Good for a night when you got to camp late.",
            ingredients: [
                Ingredient(name: "large shrimp, peeled", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "garlic, minced", amount: "4 cloves", scalable: true, category: .produce),
                Ingredient(name: "lemon juice", amount: "2 tablespoons", scalable: false, category: .produce),
                Ingredient(name: "parsley, chopped", amount: "2 tablespoons", scalable: false, category: .produce),
                Ingredient(name: "red pepper flakes", amount: "1/2 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Lay out a large piece of heavy-duty foil.",
                "Place shrimp in the center. Top with butter, garlic, lemon juice, and red pepper flakes.",
                "Season with salt and pepper. Fold and seal packet.",
                "Place on medium-hot coals or grill for 10-12 minutes.",
                "Shrimp are done when pink and opaque. Don't overcook or they'll get rubbery.",
                "Open packet, sprinkle with parsley, and serve."
            ],
            proTip: "Keep shrimp on ice in a sealed bag at the bottom of your cooler. Cook them the first night.",
            safetyNote: "Keep raw shrimp separate from other food. Wash hands after handling.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "foil-packet-sausage-peppers",
            name: "Sausage and Peppers",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 8,
            cookTime: 18,
            servings: 4,
            difficulty: .easy,
            introduction: "Italian sausages with onions and peppers. Serve on hoagie rolls or eat straight from the packet.",
            ingredients: [
                Ingredient(name: "Italian sausage links", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "bell peppers, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "onion, sliced", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "1 tablespoon", scalable: false, category: .pantry),
                Ingredient(name: "Italian seasoning", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "garlic powder", amount: "1/2 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "hoagie rolls (optional)", amount: "4", scalable: true, category: .bread)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut a large piece of heavy-duty foil and fold it in half.",
                "Place sausages in the center. Pile peppers and onions on top.",
                "Drizzle with oil and sprinkle with Italian seasoning and garlic powder.",
                "Seal packet tightly, leaving space for air circulation.",
                "Cook on hot coals or grill for 15-18 minutes, turning once.",
                "Check that sausages are browned and cooked through. Serve on rolls if using."
            ],
            proTip: "Poke a few small holes in the top of the packet with a fork before cooking. Lets smoke in and steam out.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "foil-packet-apple-cinnamon-oats",
            name: "Apple Cinnamon Oats",
            cookingMethod: .foilPacket,
            mealType: .breakfast,
            prepTime: 5,
            cookTime: 15,
            servings: 2,
            difficulty: .easy,
            introduction: "Hot oatmeal cooked in foil while you pack up. Add it to the coals when you start your coffee.",
            ingredients: [
                Ingredient(name: "rolled oats", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "water", amount: "2 cups", scalable: true, category: .other),
                Ingredient(name: "apple, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "brown sugar", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "cinnamon", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "butter", amount: "1 tablespoon", scalable: true, category: .dairy),
                Ingredient(name: "raisins (optional)", amount: "1/4 cup", scalable: true, category: .pantry)
            ],
            equipment: [
                "Heavy-duty aluminum foil",
                "Bowl for forming packet"
            ],
            steps: [
                "Tear off two large sheets of foil. Stack them and press into a bowl to form a bowl shape.",
                "Add oats, water, apple, brown sugar, cinnamon, and raisins if using. Stir.",
                "Dot with butter. Bring foil edges up and crimp tightly at the top.",
                "Place packet on warm coals (not directly on flames). Cook 12-15 minutes.",
                "Shake gently once or twice while cooking.",
                "Open carefully and stir before serving."
            ],
            proTip: "Make a foil bowl instead of a flat packet. Keeps the oats from spilling and makes stirring easier.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.quickMeals, .winterCamping, .ultralight, .bikepacking],
            isPremium: false
        ),

        Recipe(
            id: "foil-packet-veggie-medley",
            name: "Grilled Veggie Medley",
            cookingMethod: .foilPacket,
            mealType: .lunch,
            prepTime: 12,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Colorful vegetables with garlic and herbs. Works as a side or toss with pasta for a full meal.",
            ingredients: [
                Ingredient(name: "zucchini, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "yellow squash, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "cherry tomatoes", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "red onion, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: false, category: .produce),
                Ingredient(name: "dried basil", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut a large sheet of heavy-duty foil. Double it if using regular foil.",
                "Pile vegetables in the center. Drizzle with olive oil and sprinkle with garlic and basil.",
                "Season with salt and pepper. Toss to coat.",
                "Fold foil into a sealed packet, leaving room for steam.",
                "Place on grill grate or medium coals for 18-20 minutes, shaking once halfway.",
                "Vegetables should be tender and slightly charred when done."
            ],
            proTip: "Cut vegetables the same thickness so they cook evenly. About half-inch rounds work well.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "foil-packet-bbq-chicken",
            name: "BBQ Chicken Packets",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 25,
            servings: 4,
            difficulty: .easy,
            introduction: "Chicken thighs stay moist in foil with BBQ sauce and onions. A good one for the first night.",
            ingredients: [
                Ingredient(name: "chicken thighs, bone-in", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "BBQ sauce", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "onion, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "smoked paprika", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Season chicken thighs with garlic powder, paprika, salt, and pepper.",
                "Cut four large pieces of foil. Place two thighs on each piece.",
                "Top with sliced onions and pour BBQ sauce over each portion.",
                "Seal packets tightly, crimping edges.",
                "Place on medium coals or grill for 20-25 minutes, turning once.",
                "Check that chicken is fully cooked. Juices should run clear."
            ],
            proTip: "Bone-in thighs are harder to overcook than breasts. They stay juicy even if you lose track of time.",
            safetyNote: "Chicken must reach 165F internal temperature. If in doubt, tear open the thickest piece.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: false
        ),

        // MARK: - Premium Recipes (16)

        Recipe(
            id: "foil-packet-teriyaki-salmon",
            name: "Teriyaki Salmon",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 8,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Salmon steams perfectly in foil with teriyaki sauce and vegetables. Feels fancy but takes no effort.",
            ingredients: [
                Ingredient(name: "salmon fillets", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "teriyaki sauce", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "broccoli florets", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "snap peas", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "sesame oil", amount: "1 tablespoon", scalable: false, category: .pantry),
                Ingredient(name: "garlic, minced", amount: "2 cloves", scalable: false, category: .produce),
                Ingredient(name: "green onions, sliced", amount: "2", scalable: false, category: .produce),
                Ingredient(name: "sesame seeds", amount: "1 tablespoon", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut four sheets of foil. Brush each with sesame oil.",
                "Place one salmon fillet in the center of each sheet.",
                "Arrange broccoli and snap peas around the fish. Top with garlic.",
                "Pour teriyaki sauce over each fillet.",
                "Seal packets tightly, leaving air space inside.",
                "Cook on medium coals for 12-15 minutes until salmon flakes easily.",
                "Open packets, garnish with green onions and sesame seeds."
            ],
            proTip: "Salmon cooks fast. When you think it needs five more minutes, it's probably done.",
            safetyNote: "Keep fish on ice and cook within 24 hours of packing your cooler.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-brats-and-kraut",
            name: "Brats and Sauerkraut",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Beer-steamed bratwurst with sauerkraut and onions. Classic German camp food.",
            ingredients: [
                Ingredient(name: "bratwurst links", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "sauerkraut, drained", amount: "2 cups", scalable: true, category: .canned),
                Ingredient(name: "onion, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "beer", amount: "1/2 cup", scalable: false, category: .drinks),
                Ingredient(name: "whole grain mustard", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "caraway seeds", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "hoagie rolls", amount: "4", scalable: true, category: .bread)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Tear off a large sheet of heavy-duty foil and double it.",
                "Spread sauerkraut and onions in the center. Sprinkle with caraway seeds.",
                "Place brats on top. Pour beer over everything.",
                "Seal packet tightly.",
                "Cook on hot coals for 18-20 minutes, turning once.",
                "Open carefully. Serve brats on rolls with kraut and mustard."
            ],
            proTip: "The leftover beer is camp fuel. Never waste it.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-steak-potatoes",
            name: "Steak and Potatoes",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 25,
            servings: 4,
            difficulty: .medium,
            introduction: "Sirloin strips with baby potatoes and green beans. Takes some practice to get the steak doneness right.",
            ingredients: [
                Ingredient(name: "sirloin steak, sliced thin", amount: "1.5 lbs", scalable: true, category: .meat),
                Ingredient(name: "baby potatoes, halved", amount: "1 lb", scalable: true, category: .produce),
                Ingredient(name: "green beans, trimmed", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "onion powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "Worcestershire sauce", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut four large sheets of foil.",
                "Divide potatoes among packets. Top with green beans and steak strips.",
                "Dot each with butter. Drizzle with Worcestershire sauce.",
                "Sprinkle with garlic powder, onion powder, salt, and pepper.",
                "Seal packets, leaving room for steam.",
                "Cook on medium-hot coals for 20-25 minutes, turning twice.",
                "Check potatoes are tender before serving."
            ],
            proTip: "Slice steak thin against the grain before packing. It cooks faster and chews easier.",
            safetyNote: nil,
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-cajun-shrimp-sausage",
            name: "Cajun Shrimp and Sausage",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Spicy shrimp with andouille sausage, corn, and potatoes. Louisiana flavor in a foil packet.",
            ingredients: [
                Ingredient(name: "large shrimp, peeled", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "andouille sausage, sliced", amount: "12 oz", scalable: true, category: .meat),
                Ingredient(name: "baby potatoes, quartered", amount: "1 lb", scalable: true, category: .produce),
                Ingredient(name: "corn on the cob, cut into rounds", amount: "2 ears", scalable: true, category: .produce),
                Ingredient(name: "Cajun seasoning", amount: "2 tablespoons", scalable: false, category: .spices),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "lemon wedges", amount: "1", scalable: false, category: .produce),
                Ingredient(name: "fresh parsley", amount: "2 tablespoons", scalable: false, category: .produce)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut four large pieces of foil.",
                "Divide potatoes, sausage, and corn among packets.",
                "Top with shrimp. Sprinkle with Cajun seasoning and dot with butter.",
                "Seal packets tightly.",
                "Cook on medium coals for 12-15 minutes until potatoes are tender and shrimp are pink.",
                "Open carefully. Squeeze lemon over everything and garnish with parsley."
            ],
            proTip: "Parboil the potatoes at home for 5 minutes. They'll cook through faster at camp.",
            safetyNote: "Keep shrimp on ice. Cook the first night for best quality.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-pizza",
            name: "Pizza",
            cookingMethod: .foilPacket,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 12,
            servings: 4,
            difficulty: .medium,
            introduction: "Personal pizzas cooked in foil. The crust gets crispy if you get the heat right.",
            ingredients: [
                Ingredient(name: "pizza dough (store-bought or homemade)", amount: "1 lb", scalable: true, category: .bread),
                Ingredient(name: "pizza sauce", amount: "1 cup", scalable: true, category: .canned),
                Ingredient(name: "mozzarella cheese, shredded", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "pepperoni", amount: "1 cup", scalable: true, category: .meat),
                Ingredient(name: "Italian seasoning", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: [
                "Heavy-duty aluminum foil",
                "Flat surface for rolling dough"
            ],
            steps: [
                "Divide dough into four portions. Roll each into a 6-inch circle.",
                "Brush one side of each circle with olive oil.",
                "Place dough oil-side-down on foil. Top with sauce, cheese, and pepperoni.",
                "Sprinkle with Italian seasoning.",
                "Fold foil over pizza, sealing edges but keeping foil off the cheese.",
                "Cook on medium coals for 10-12 minutes. Check bottom for browning.",
                "Slide off foil and serve."
            ],
            proTip: "Oil the dough side that touches the foil. Keeps it from sticking and helps it crisp up.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-coconut-curry-veggies",
            name: "Coconut Curry Vegetables",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 12,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Sweet potatoes and chickpeas in coconut curry sauce. Serve over rice or eat straight from the packet.",
            ingredients: [
                Ingredient(name: "sweet potato, cubed", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "chickpeas, drained", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "coconut milk", amount: "1 cup", scalable: true, category: .canned),
                Ingredient(name: "curry powder", amount: "2 tablespoons", scalable: false, category: .spices),
                Ingredient(name: "garlic, minced", amount: "2 cloves", scalable: false, category: .produce),
                Ingredient(name: "ginger, minced", amount: "1 teaspoon", scalable: false, category: .produce),
                Ingredient(name: "spinach, fresh", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "lime", amount: "1", scalable: false, category: .produce),
                Ingredient(name: "cilantro", amount: "2 tablespoons", scalable: false, category: .produce)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut large sheets of foil and double-layer them.",
                "Divide sweet potatoes and chickpeas among packets.",
                "Mix coconut milk with curry powder, garlic, and ginger. Pour over vegetables.",
                "Seal packets tightly, leaving room for steam.",
                "Cook on medium coals for 18-20 minutes until sweet potatoes are tender.",
                "Open packets and stir in fresh spinach. Reseal for 2 minutes to wilt.",
                "Squeeze lime over top and garnish with cilantro."
            ],
            proTip: "Cube sweet potatoes at home and soak in water. Keeps them from browning in the cooler.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-lemon-herb-chicken",
            name: "Lemon Herb Chicken",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 22,
            servings: 4,
            difficulty: .easy,
            introduction: "Chicken breasts with lemon, garlic, and fresh herbs. Light and summery.",
            ingredients: [
                Ingredient(name: "chicken breasts", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "lemon, sliced thin", amount: "1", scalable: false, category: .produce),
                Ingredient(name: "garlic, minced", amount: "4 cloves", scalable: false, category: .produce),
                Ingredient(name: "fresh rosemary", amount: "2 sprigs", scalable: false, category: .spices),
                Ingredient(name: "fresh thyme", amount: "4 sprigs", scalable: false, category: .spices),
                Ingredient(name: "olive oil", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "white wine (optional)", amount: "1/4 cup", scalable: false, category: .drinks),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut four sheets of foil. Brush each with olive oil.",
                "Place one chicken breast on each sheet. Season with salt and pepper.",
                "Top with lemon slices, garlic, rosemary, and thyme.",
                "Drizzle with remaining olive oil and wine if using.",
                "Seal packets tightly.",
                "Cook on medium coals for 20-22 minutes until chicken is cooked through.",
                "Let rest 3 minutes before opening."
            ],
            proTip: "Bring fresh herbs in a damp paper towel inside a zip-lock bag. Stays fresh for days.",
            safetyNote: "Chicken must reach 165F. Check the thickest part.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-maple-cinnamon-apples",
            name: "Maple Cinnamon Apples",
            cookingMethod: .foilPacket,
            mealType: .dessert,
            prepTime: 8,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Warm spiced apples with maple syrup. Top with vanilla ice cream if you're feeling fancy.",
            ingredients: [
                Ingredient(name: "apples, sliced", amount: "4 large", scalable: true, category: .produce),
                Ingredient(name: "maple syrup", amount: "1/4 cup", scalable: true, category: .pantry),
                Ingredient(name: "brown sugar", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "cinnamon", amount: "1 tablespoon", scalable: false, category: .spices),
                Ingredient(name: "butter", amount: "3 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "vanilla extract", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "vanilla ice cream (optional)", amount: "as desired", scalable: false, category: .dairy)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Tear off four large pieces of foil.",
                "Divide apple slices among packets.",
                "Drizzle with maple syrup. Sprinkle with brown sugar and cinnamon.",
                "Dot with butter and add a few drops of vanilla to each.",
                "Seal packets loosely, allowing room for steam.",
                "Cook on warm coals for 12-15 minutes until apples are soft.",
                "Serve warm, topped with ice cream if desired."
            ],
            proTip: "Pack ice cream in dry ice at the bottom of your cooler. It'll last two days if you don't open the cooler much.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-philly-cheesesteak",
            name: "Philly Cheesesteak Packets",
            cookingMethod: .foilPacket,
            mealType: .lunch,
            prepTime: 12,
            cookTime: 18,
            servings: 4,
            difficulty: .easy,
            introduction: "Steak with peppers, onions, and melted cheese. Serve on hoagie rolls for a classic sandwich.",
            ingredients: [
                Ingredient(name: "ribeye steak, sliced thin", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "bell peppers, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "onion, sliced", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "mushrooms, sliced", amount: "8 oz", scalable: true, category: .produce),
                Ingredient(name: "provolone cheese, sliced", amount: "8 slices", scalable: true, category: .dairy),
                Ingredient(name: "Worcestershire sauce", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "hoagie rolls", amount: "4", scalable: true, category: .bread)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut four large sheets of foil.",
                "Divide steak, peppers, onions, and mushrooms among packets.",
                "Drizzle with Worcestershire sauce. Sprinkle with garlic powder, salt, and pepper.",
                "Seal packets tightly.",
                "Cook on hot coals for 15 minutes, turning once.",
                "Open packets and top with provolone. Reseal for 2-3 minutes to melt.",
                "Serve on toasted hoagie rolls."
            ],
            proTip: "Ask the butcher to slice your steak paper-thin. Most will do it if you're buying a pound or more.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-mexican-street-corn",
            name: "Mexican Street Corn",
            cookingMethod: .foilPacket,
            mealType: .snack,
            prepTime: 5,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Grilled corn with mayo, cotija cheese, lime, and chili powder. Classic elote made easy.",
            ingredients: [
                Ingredient(name: "corn on the cob", amount: "4 ears", scalable: true, category: .produce),
                Ingredient(name: "mayonnaise", amount: "1/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "cotija cheese, crumbled", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "chili powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "lime", amount: "1", scalable: false, category: .produce),
                Ingredient(name: "cilantro, chopped", amount: "2 tablespoons", scalable: false, category: .produce),
                Ingredient(name: "butter", amount: "2 tablespoons", scalable: false, category: .dairy)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Husk corn and remove silk.",
                "Brush each ear with butter and wrap tightly in foil.",
                "Cook on hot coals for 12-15 minutes, turning every 3 minutes.",
                "Remove from foil and brush with mayonnaise while hot.",
                "Sprinkle with cotija, chili powder, and cilantro.",
                "Squeeze lime over top and serve."
            ],
            proTip: "Leave the husks on and peel back to remove silk. The husks protect the corn and add smoky flavor.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-breakfast-taters",
            name: "Loaded Breakfast Potatoes",
            cookingMethod: .foilPacket,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 25,
            servings: 4,
            difficulty: .easy,
            introduction: "Crispy potatoes with bacon, cheese, and sour cream. Heavy breakfast that keeps you going all morning.",
            ingredients: [
                Ingredient(name: "russet potatoes, diced", amount: "4 cups", scalable: true, category: .produce),
                Ingredient(name: "bacon, cooked and crumbled", amount: "6 slices", scalable: true, category: .meat),
                Ingredient(name: "shredded cheddar", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "green onions, sliced", amount: "3", scalable: false, category: .produce),
                Ingredient(name: "sour cream", amount: "1/2 cup", scalable: false, category: .dairy),
                Ingredient(name: "butter", amount: "3 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Double-layer foil sheets.",
                "Divide potatoes among packets. Dot with butter and season with garlic powder, salt, and pepper.",
                "Seal tightly and cook on medium-hot coals for 20 minutes, flipping every 5 minutes.",
                "Open packets and check potatoes are crispy. Add bacon and cheese.",
                "Reseal for 3 minutes to melt cheese.",
                "Top with green onions and sour cream before serving."
            ],
            proTip: "Cook bacon at home and store in a zip-lock. The grease makes a great fire starter.",
            safetyNote: nil,
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-s-mores-dip",
            name: "S'mores Dip",
            cookingMethod: .foilPacket,
            mealType: .dessert,
            prepTime: 5,
            cookTime: 10,
            servings: 6,
            difficulty: .easy,
            introduction: "Melted chocolate with toasted marshmallows. Scoop it up with graham crackers.",
            ingredients: [
                Ingredient(name: "chocolate chips", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "marshmallows", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "graham crackers", amount: "1 box", scalable: true, category: .pantry),
                Ingredient(name: "butter", amount: "2 tablespoons", scalable: false, category: .dairy)
            ],
            equipment: [
                "Heavy-duty aluminum foil",
                "Pie tin or shallow pan"
            ],
            steps: [
                "Line a pie tin with foil or create a shallow foil pan.",
                "Spread chocolate chips in the bottom. Dot with butter.",
                "Cover with foil and place on warm coals for 5-7 minutes until chocolate melts.",
                "Remove foil top and add marshmallows.",
                "Return to coals uncovered for 3-5 minutes until marshmallows are golden and toasted.",
                "Serve immediately with graham crackers for dipping."
            ],
            proTip: "Watch the marshmallows close. They go from perfect to charred in about 30 seconds.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .quickMeals],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-italian-chicken-veggies",
            name: "Italian Chicken and Vegetables",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 12,
            cookTime: 22,
            servings: 4,
            difficulty: .easy,
            introduction: "Chicken with zucchini, tomatoes, and Italian herbs. Light summer meal that works over coals or on a grill.",
            ingredients: [
                Ingredient(name: "chicken breasts, sliced", amount: "1.5 lbs", scalable: true, category: .meat),
                Ingredient(name: "zucchini, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "cherry tomatoes", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "red onion, sliced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "Italian seasoning", amount: "2 teaspoons", scalable: false, category: .spices),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: false, category: .produce),
                Ingredient(name: "balsamic vinegar", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "fresh basil", amount: "1/4 cup", scalable: false, category: .produce)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Cut four large sheets of foil.",
                "Divide chicken, zucchini, tomatoes, and onions among packets.",
                "Drizzle with olive oil and balsamic vinegar. Sprinkle with Italian seasoning and garlic.",
                "Seal packets tightly.",
                "Cook on medium coals for 20-22 minutes until chicken is cooked through.",
                "Open carefully and top with fresh basil before serving."
            ],
            proTip: "Slice vegetables into uniform thickness. Everything cooks at the same rate that way.",
            safetyNote: "Check chicken reaches 165F internal temperature.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-honey-mustard-pork",
            name: "Honey Mustard Pork Chops",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 8,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Bone-in pork chops with honey mustard glaze and green beans. Sweet and tangy.",
            ingredients: [
                Ingredient(name: "pork chops, bone-in", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "green beans, trimmed", amount: "1 lb", scalable: true, category: .produce),
                Ingredient(name: "Dijon mustard", amount: "1/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "honey", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "garlic, minced", amount: "2 cloves", scalable: false, category: .produce),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Mix mustard, honey, and garlic in a small container.",
                "Cut four sheets of foil. Place one pork chop on each.",
                "Brush chops generously with honey mustard mixture. Season with salt and pepper.",
                "Arrange green beans around each chop. Drizzle with olive oil.",
                "Seal packets tightly.",
                "Cook on medium coals for 18-20 minutes, turning once.",
                "Check pork is cooked through before serving."
            ],
            proTip: "Bone-in chops have more flavor and stay juicier than boneless. Worth the extra weight in your cooler.",
            safetyNote: "Pork should reach 145F internal temperature.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-asian-beef-broccoli",
            name: "Asian Beef and Broccoli",
            cookingMethod: .foilPacket,
            mealType: .dinner,
            prepTime: 12,
            cookTime: 18,
            servings: 4,
            difficulty: .easy,
            introduction: "Thin-sliced beef with broccoli in a soy-ginger sauce. Serve over instant rice.",
            ingredients: [
                Ingredient(name: "flank steak, sliced thin", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "broccoli florets", amount: "3 cups", scalable: true, category: .produce),
                Ingredient(name: "soy sauce", amount: "1/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "brown sugar", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: false, category: .produce),
                Ingredient(name: "ginger, minced", amount: "1 tablespoon", scalable: false, category: .produce),
                Ingredient(name: "sesame oil", amount: "1 tablespoon", scalable: false, category: .pantry),
                Ingredient(name: "cornstarch", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "sesame seeds", amount: "1 tablespoon", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil"
            ],
            steps: [
                "Mix soy sauce, brown sugar, garlic, ginger, sesame oil, and cornstarch.",
                "Cut four sheets of foil. Divide beef and broccoli among packets.",
                "Pour sauce over each portion.",
                "Seal packets tightly, leaving room for steam.",
                "Cook on medium-hot coals for 15-18 minutes, turning once.",
                "Open carefully and sprinkle with sesame seeds before serving."
            ],
            proTip: "Freeze the steak for 30 minutes before slicing. Makes it easier to get paper-thin cuts.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "foil-packet-hot-toddy",
            name: "Hot Toddy",
            cookingMethod: .foilPacket,
            mealType: .drink,
            prepTime: 5,
            cookTime: 10,
            servings: 2,
            difficulty: .easy,
            introduction: "Hot water with whiskey, honey, and lemon heated in foil. Warms you up on cold nights.",
            ingredients: [
                Ingredient(name: "water", amount: "2 cups", scalable: true, category: .other),
                Ingredient(name: "whiskey or bourbon", amount: "4 oz", scalable: true, category: .drinks),
                Ingredient(name: "honey", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "lemon, sliced", amount: "1", scalable: false, category: .produce),
                Ingredient(name: "cinnamon sticks", amount: "2", scalable: true, category: .spices),
                Ingredient(name: "whole cloves", amount: "4", scalable: false, category: .spices)
            ],
            equipment: [
                "Heavy-duty aluminum foil",
                "Mugs"
            ],
            steps: [
                "Create a foil pouch by stacking two sheets of foil.",
                "Pour water into the pouch. Add honey, lemon slices, cinnamon sticks, and cloves.",
                "Seal tightly, leaving air space.",
                "Place on warm coals for 8-10 minutes until hot.",
                "Open carefully and pour into mugs.",
                "Add whiskey to each mug and stir."
            ],
            proTip: "Bring a small whisk in a zip-lock. Makes mixing honey into hot drinks way easier than stirring with a stick.",
            safetyNote: "Only for adults 21 and over. Keep alcohol away from open flames.",
            dietaryTags: [.vegetarian, .glutenFree, .dairyFree, .nutFree],
            tags: [.quickMeals, .winterCamping],
            isPremium: true
        )
    ]
}
