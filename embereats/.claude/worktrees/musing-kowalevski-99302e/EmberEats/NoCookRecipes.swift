import Foundation

extension RecipeDatabase {
    static let noCookRecipes: [Recipe] = [
        // MARK: - Free Recipes (8)

        Recipe(
            id: "nocook-001",
            name: "Trail Mix",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Mix it at home or at camp. This keeps for the whole trip in a sealed bag.",
            ingredients: [
                Ingredient(name: "salted peanuts", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "raisins", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "chocolate chips", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "sunflower seeds", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "dried cranberries", amount: "1/2 cup", scalable: true, category: .produce)
            ],
            equipment: ["resealable bag or container"],
            steps: [
                "Combine all ingredients in a large bowl or bag.",
                "Mix well to distribute everything evenly.",
                "Store in a sealed container or zip-lock bag."
            ],
            proTip: "Keep trail mix in the bear bag at night even if the chocolate chips are melted. Bears can smell sugar from half a mile away.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .glutenFree, .dairyFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "nocook-002",
            name: "Turkey & Cheese Wraps",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "A solid lunch when you don't want to deal with heat. Pack deli meat in the coldest part of your cooler.",
            ingredients: [
                Ingredient(name: "large flour tortillas", amount: "4", scalable: true, category: .bread),
                Ingredient(name: "sliced deli turkey", amount: "8 oz", scalable: true, category: .meat),
                Ingredient(name: "sliced cheese", amount: "8 slices", scalable: true, category: .dairy),
                Ingredient(name: "lettuce leaves", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "mustard or mayo", amount: "to taste", scalable: false, category: .pantry)
            ],
            equipment: ["cutting board", "knife"],
            steps: [
                "Lay tortilla flat on a clean surface.",
                "Spread mustard or mayo down the center.",
                "Layer turkey, cheese, and lettuce on top.",
                "Roll tightly and cut in half if desired."
            ],
            proTip: "Freeze deli meat at home before packing. It thaws by lunch and keeps your cooler colder in the meantime.",
            safetyNote: "Keep deli meat at the bottom of the cooler where it's coldest. Use within two days of thawing.",
            dietaryTags: [.nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "nocook-003",
            name: "Overnight Oats",
            cookingMethod: .noCook,
            mealType: .breakfast,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Prep before bed and wake up to breakfast already made. No heat, no cleanup.",
            ingredients: [
                Ingredient(name: "rolled oats", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "milk or almond milk", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "honey or maple syrup", amount: "2 tbsp", scalable: true, category: .pantry),
                Ingredient(name: "cinnamon", amount: "1 tsp", scalable: false, category: .spices),
                Ingredient(name: "dried fruit or nuts", amount: "1/2 cup", scalable: true, category: .produce)
            ],
            equipment: ["container with lid", "spoon"],
            steps: [
                "Combine oats, milk, honey, and cinnamon in a container.",
                "Stir well to mix.",
                "Add dried fruit or nuts on top.",
                "Seal and place in cooler overnight.",
                "Stir and eat cold in the morning."
            ],
            proTip: "Use wide-mouth mason jars so you can eat straight from the jar. One less dish to wash at camp.",
            safetyNote: nil,
            dietaryTags: [.vegetarian],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: false
        ),

        Recipe(
            id: "nocook-004",
            name: "Hummus & Veggie Plate",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Fresh vegetables and hummus make a quick lunch that doesn't need refrigeration until opened.",
            ingredients: [
                Ingredient(name: "hummus", amount: "16 oz", scalable: true, category: .pantry),
                Ingredient(name: "carrots, cut into sticks", amount: "4 large", scalable: true, category: .produce),
                Ingredient(name: "celery, cut into sticks", amount: "4 stalks", scalable: true, category: .produce),
                Ingredient(name: "bell peppers, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "cherry tomatoes", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "pita bread or crackers", amount: "1 package", scalable: true, category: .bread)
            ],
            equipment: ["cutting board", "knife", "plates"],
            steps: [
                "Cut vegetables into sticks or bite-sized pieces.",
                "Arrange vegetables on plates.",
                "Serve with hummus and pita or crackers for dipping."
            ],
            proTip: "Prep vegetables at home and store in a container with a damp paper towel. They'll stay crisp for days in the cooler.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .dairyFree, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "nocook-005",
            name: "PB&J Sandwiches",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "The camp classic. No cooler needed, no fuss, and everyone knows how to make it.",
            ingredients: [
                Ingredient(name: "bread", amount: "8 slices", scalable: true, category: .bread),
                Ingredient(name: "peanut butter", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "jelly or jam", amount: "1/2 cup", scalable: true, category: .pantry)
            ],
            equipment: ["knife"],
            steps: [
                "Lay out bread slices.",
                "Spread peanut butter on half the slices.",
                "Spread jelly on the other half.",
                "Press together to make sandwiches."
            ],
            proTip: "Spread peanut butter on both slices of bread to seal them. Keeps the jelly from soaking through on a long hike.",
            safetyNote: "Check for nut allergies before serving.",
            dietaryTags: [.vegetarian, .dairyFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "nocook-006",
            name: "Fruit & Cheese Plate",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Simple, no prep needed beyond slicing. Good for a midday break at camp.",
            ingredients: [
                Ingredient(name: "cheese blocks, assorted", amount: "12 oz", scalable: true, category: .dairy),
                Ingredient(name: "crackers", amount: "1 box", scalable: true, category: .pantry),
                Ingredient(name: "apples, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "grapes", amount: "2 cups", scalable: true, category: .produce)
            ],
            equipment: ["cutting board", "knife", "plate"],
            steps: [
                "Slice cheese into cubes or thin slices.",
                "Slice apples and remove cores.",
                "Arrange cheese, crackers, apples, and grapes on a plate.",
                "Serve."
            ],
            proTip: "Hard cheeses like cheddar and gouda last longer without refrigeration. Skip the soft cheeses unless your cooler is packed with ice.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "nocook-007",
            name: "Granola & Yogurt",
            cookingMethod: .noCook,
            mealType: .breakfast,
            prepTime: 3,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Quick breakfast that works when you're trying to get on the trail early.",
            ingredients: [
                Ingredient(name: "yogurt", amount: "4 cups", scalable: true, category: .dairy),
                Ingredient(name: "granola", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "honey", amount: "2 tbsp", scalable: true, category: .pantry),
                Ingredient(name: "fresh berries (optional)", amount: "1 cup", scalable: true, category: .produce)
            ],
            equipment: ["bowls", "spoons"],
            steps: [
                "Divide yogurt into bowls.",
                "Top with granola.",
                "Drizzle honey over the top.",
                "Add berries if using."
            ],
            proTip: "Greek yogurt stays good longer in the cooler than regular yogurt. Check the date and keep it cold.",
            safetyNote: nil,
            dietaryTags: [.vegetarian],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "nocook-008",
            name: "Tuna Salad",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Pack pouches of tuna instead of cans. Easier to pack out and no can opener needed.",
            ingredients: [
                Ingredient(name: "tuna pouches", amount: "4", scalable: true, category: .canned),
                Ingredient(name: "mayonnaise", amount: "1/4 cup", scalable: true, category: .pantry),
                Ingredient(name: "diced celery", amount: "1/2 cup", scalable: true, category: .produce),
                Ingredient(name: "diced red onion", amount: "1/4 cup", scalable: true, category: .produce),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "bread or crackers", amount: "for serving", scalable: false, category: .bread)
            ],
            equipment: ["bowl", "spoon"],
            steps: [
                "Open tuna pouches and drain if needed.",
                "Combine tuna, mayo, celery, and onion in a bowl.",
                "Season with salt and pepper.",
                "Mix well and serve on bread or crackers."
            ],
            proTip: "Keep mayo in the cooler until you're ready to use it. Once opened, use it within a day or two at camp.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: false
        ),

        // MARK: - Premium Recipes (22)

        Recipe(
            id: "nocook-009",
            name: "Caprese Salad",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Fresh mozzarella and tomatoes make a light meal. Tastes better at camp than it has any right to.",
            ingredients: [
                Ingredient(name: "fresh mozzarella, sliced", amount: "8 oz", scalable: true, category: .dairy),
                Ingredient(name: "tomatoes, sliced", amount: "4 large", scalable: true, category: .produce),
                Ingredient(name: "fresh basil leaves", amount: "1/2 cup", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "3 tbsp", scalable: false, category: .pantry),
                Ingredient(name: "balsamic vinegar", amount: "2 tbsp", scalable: false, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["cutting board", "knife", "plate"],
            steps: [
                "Slice tomatoes and mozzarella into 1/4-inch rounds.",
                "Arrange on a plate, alternating tomato and mozzarella slices.",
                "Tuck basil leaves between slices.",
                "Drizzle with olive oil and balsamic vinegar.",
                "Season with salt and pepper."
            ],
            proTip: "Cherry tomatoes hold up better in the cooler than big slicing tomatoes. Less bruising, same flavor.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.quickMeals, .ultralight],
            isPremium: true
        ),

        Recipe(
            id: "nocook-010",
            name: "Cold Brew Coffee",
            cookingMethod: .noCook,
            mealType: .drink,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Make it before bed and wake up to strong coffee without starting a fire.",
            ingredients: [
                Ingredient(name: "coarsely ground coffee", amount: "1 cup", scalable: true, category: .drinks),
                Ingredient(name: "cold water", amount: "4 cups", scalable: true, category: .drinks)
            ],
            equipment: ["large container or jar", "coffee filter or cheesecloth"],
            steps: [
                "Combine coffee grounds and cold water in a container.",
                "Stir to saturate all the grounds.",
                "Cover and let steep overnight or 12 hours.",
                "Strain through a coffee filter or cheesecloth into a clean container.",
                "Serve over ice or dilute with water to taste."
            ],
            proTip: "Use a bandana as a makeshift coffee filter if you forgot yours. It works better than you'd think.",
            safetyNote: nil,
            dietaryTags: [.vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "nocook-011",
            name: "No-Bake Energy Bites",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 15,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Make these at home before the trip. They pack tight and don't melt like chocolate bars.",
            ingredients: [
                Ingredient(name: "rolled oats", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "peanut butter", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "honey", amount: "1/3 cup", scalable: true, category: .pantry),
                Ingredient(name: "chocolate chips", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "flax seeds or chia seeds", amount: "2 tbsp", scalable: false, category: .pantry)
            ],
            equipment: ["bowl", "spoon"],
            steps: [
                "Mix all ingredients in a bowl until well combined.",
                "Roll mixture into 1-inch balls with your hands.",
                "Store in a sealed container in the cooler or with dry goods."
            ],
            proTip: "Wet your hands slightly before rolling the balls. Keeps the mixture from sticking to your palms.",
            safetyNote: "Check for nut allergies before serving.",
            dietaryTags: [.vegetarian, .dairyFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "nocook-012",
            name: "Smoked Salmon Bagels",
            cookingMethod: .noCook,
            mealType: .breakfast,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "A good first-morning breakfast when the cooler is still cold and you haven't unpacked everything yet.",
            ingredients: [
                Ingredient(name: "bagels", amount: "4", scalable: true, category: .bread),
                Ingredient(name: "cream cheese", amount: "8 oz", scalable: true, category: .dairy),
                Ingredient(name: "smoked salmon", amount: "8 oz", scalable: true, category: .meat),
                Ingredient(name: "sliced red onion", amount: "1/4 cup", scalable: true, category: .produce),
                Ingredient(name: "capers (optional)", amount: "2 tbsp", scalable: false, category: .pantry)
            ],
            equipment: ["knife"],
            steps: [
                "Slice bagels in half.",
                "Spread cream cheese on both halves.",
                "Layer smoked salmon on one half.",
                "Top with red onion and capers if using.",
                "Close bagel and serve."
            ],
            proTip: "Smoked salmon lasts longer than fresh fish in the cooler. Buy vacuum-sealed packs and keep them closed until you're ready to eat.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "nocook-013",
            name: "Greek Salad",
            cookingMethod: .noCook,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Crisp vegetables and feta make a full meal when you're too tired to cook.",
            ingredients: [
                Ingredient(name: "romaine lettuce, chopped", amount: "4 cups", scalable: true, category: .produce),
                Ingredient(name: "cucumber, diced", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "cherry tomatoes, halved", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "red onion, sliced thin", amount: "1/2", scalable: true, category: .produce),
                Ingredient(name: "feta cheese, crumbled", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "kalamata olives", amount: "1/2 cup", scalable: true, category: .canned),
                Ingredient(name: "olive oil", amount: "1/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "lemon juice", amount: "2 tbsp", scalable: false, category: .produce),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["large bowl", "knife", "cutting board"],
            steps: [
                "Chop lettuce and place in a large bowl.",
                "Add cucumber, tomatoes, onion, feta, and olives.",
                "Drizzle with olive oil and lemon juice.",
                "Season with salt and pepper.",
                "Toss to combine and serve."
            ],
            proTip: "Romaine lettuce holds up in the cooler better than soft greens. Wrap it in a dry dish towel to keep it crisp.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.quickMeals, .ultralight],
            isPremium: true
        ),

        Recipe(
            id: "nocook-014",
            name: "Peanut Butter Banana Wraps",
            cookingMethod: .noCook,
            mealType: .breakfast,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Quick breakfast or snack that kids can make themselves while you break down camp.",
            ingredients: [
                Ingredient(name: "flour tortillas", amount: "4", scalable: true, category: .bread),
                Ingredient(name: "peanut butter", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "bananas", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "honey (optional)", amount: "2 tbsp", scalable: false, category: .pantry)
            ],
            equipment: ["knife"],
            steps: [
                "Spread peanut butter over each tortilla.",
                "Place a banana on one edge of the tortilla.",
                "Drizzle with honey if using.",
                "Roll tortilla tightly around the banana.",
                "Slice in half and serve."
            ],
            proTip: "Bring bananas that are slightly green. They'll ripen over the trip and won't bruise in your pack.",
            safetyNote: "Check for nut allergies before serving.",
            dietaryTags: [.vegetarian, .dairyFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-015",
            name: "Pasta Salad",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Cook pasta at home and bring it cold. A full meal that travels well in a cooler.",
            ingredients: [
                Ingredient(name: "cooked pasta, chilled (prep at home)", amount: "4 cups", scalable: true, category: .pantry),
                Ingredient(name: "cherry tomatoes, halved", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "cucumber, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "olives, sliced", amount: "1/2 cup", scalable: true, category: .canned),
                Ingredient(name: "Italian dressing", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "parmesan cheese, grated", amount: "1/4 cup", scalable: true, category: .dairy)
            ],
            equipment: ["large bowl", "spoon"],
            steps: [
                "Combine cooked pasta, tomatoes, cucumber, and olives in a bowl.",
                "Pour Italian dressing over the top.",
                "Toss to coat evenly.",
                "Top with parmesan cheese before serving."
            ],
            proTip: "Rinse cooked pasta under cold water at home before packing. It stops the cooking and keeps it from getting gummy in the cooler.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-016",
            name: "Ants on a Log",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Old school camp snack. Kids love it and it's easier than you remember.",
            ingredients: [
                Ingredient(name: "celery stalks, cut into 3-inch pieces", amount: "8", scalable: true, category: .produce),
                Ingredient(name: "peanut butter", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "raisins", amount: "1/2 cup", scalable: true, category: .produce)
            ],
            equipment: ["knife"],
            steps: [
                "Cut celery into 3-inch pieces.",
                "Spread peanut butter along the inside curve of each piece.",
                "Press raisins into the peanut butter in a line.",
                "Serve."
            ],
            proTip: "Celery keeps for a week in the cooler if you wrap it in foil. Stays crisper than in plastic bags.",
            safetyNote: "Check for nut allergies before serving.",
            dietaryTags: [.vegetarian, .dairyFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-017",
            name: "Avocado Toast",
            cookingMethod: .noCook,
            mealType: .breakfast,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Bring bread and avocados. You don't need a toaster for this to work at camp.",
            ingredients: [
                Ingredient(name: "bread slices", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "ripe avocados", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "lemon juice", amount: "1 tbsp", scalable: false, category: .produce),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "red pepper flakes (optional)", amount: "pinch", scalable: false, category: .spices)
            ],
            equipment: ["knife", "fork"],
            steps: [
                "Cut avocados in half and remove pits.",
                "Scoop flesh into a bowl and mash with a fork.",
                "Mix in lemon juice, salt, and pepper.",
                "Spread avocado mixture on bread slices.",
                "Top with red pepper flakes if using."
            ],
            proTip: "Bring avocados that are firm but starting to give when pressed. They'll be perfect by the second morning.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .dairyFree, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "nocook-018",
            name: "Summer Sausage & Crackers",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Summer sausage doesn't need refrigeration until you cut into it. A good snack for the first day on the trail.",
            ingredients: [
                Ingredient(name: "summer sausage", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "cheese slices", amount: "8 oz", scalable: true, category: .dairy),
                Ingredient(name: "crackers", amount: "1 box", scalable: true, category: .pantry),
                Ingredient(name: "mustard (optional)", amount: "for serving", scalable: false, category: .pantry)
            ],
            equipment: ["knife", "cutting board"],
            steps: [
                "Slice summer sausage into thin rounds.",
                "Slice cheese.",
                "Arrange sausage, cheese, and crackers on a plate.",
                "Serve with mustard if desired."
            ],
            proTip: "Once you cut into summer sausage, wrap the cut end tightly in plastic wrap. It'll keep for days without drying out.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "nocook-019",
            name: "Chicken Caesar Wraps",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Use pre-cooked chicken from the store. Less prep, and it keeps well in the cooler.",
            ingredients: [
                Ingredient(name: "large flour tortillas", amount: "4", scalable: true, category: .bread),
                Ingredient(name: "cooked chicken breast, sliced", amount: "12 oz", scalable: true, category: .meat),
                Ingredient(name: "romaine lettuce, chopped", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "parmesan cheese, shaved", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "Caesar dressing", amount: "1/2 cup", scalable: true, category: .pantry)
            ],
            equipment: ["knife", "cutting board"],
            steps: [
                "Lay tortillas flat.",
                "Layer chicken, lettuce, and parmesan down the center of each.",
                "Drizzle Caesar dressing over the top.",
                "Roll tightly and cut in half.",
                "Serve."
            ],
            proTip: "Keep raw chicken and cooked chicken in separate sections of the cooler. Cross-contamination is easier to avoid than it is to fix.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "nocook-020",
            name: "Berry Parfait",
            cookingMethod: .noCook,
            mealType: .dessert,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Layer yogurt, granola, and berries. Looks fancy but takes no skill.",
            ingredients: [
                Ingredient(name: "yogurt", amount: "3 cups", scalable: true, category: .dairy),
                Ingredient(name: "granola", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "fresh berries", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "honey", amount: "2 tbsp", scalable: false, category: .pantry)
            ],
            equipment: ["cups or jars", "spoon"],
            steps: [
                "Spoon a layer of yogurt into each cup.",
                "Add a layer of granola.",
                "Add a layer of berries.",
                "Repeat layers until cups are full.",
                "Drizzle honey on top before serving."
            ],
            proTip: "Use mason jars for parfaits. They seal tight and you can prep them the night before without everything getting soggy.",
            safetyNote: nil,
            dietaryTags: [.vegetarian],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-021",
            name: "Salami & Provolone Subs",
            cookingMethod: .noCook,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Make subs when you don't feel like cooking. Salami and hard cheese last longer than most lunch meats.",
            ingredients: [
                Ingredient(name: "sub rolls", amount: "4", scalable: true, category: .bread),
                Ingredient(name: "sliced salami", amount: "8 oz", scalable: true, category: .meat),
                Ingredient(name: "sliced provolone", amount: "8 slices", scalable: true, category: .dairy),
                Ingredient(name: "lettuce leaves", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "tomato, sliced", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "red onion, sliced thin", amount: "1/2", scalable: true, category: .produce),
                Ingredient(name: "oil and vinegar or mayo", amount: "to taste", scalable: false, category: .pantry)
            ],
            equipment: ["knife"],
            steps: [
                "Slice sub rolls lengthwise without cutting all the way through.",
                "Layer salami and provolone inside each roll.",
                "Add lettuce, tomato, and onion.",
                "Drizzle with oil and vinegar or spread with mayo.",
                "Press closed and serve."
            ],
            proTip: "Wrap finished subs tightly in foil. Press them under something heavy in the cooler for an hour. They'll hold together better when you eat them.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "nocook-022",
            name: "Apple Slices with Nut Butter",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Simple, filling, and takes less than five minutes. Good when you need something fast between activities.",
            ingredients: [
                Ingredient(name: "apples", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "almond butter or peanut butter", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "cinnamon (optional)", amount: "for sprinkling", scalable: false, category: .spices)
            ],
            equipment: ["knife", "cutting board"],
            steps: [
                "Core and slice apples into wedges.",
                "Arrange on a plate.",
                "Serve with nut butter for dipping.",
                "Sprinkle with cinnamon if desired."
            ],
            proTip: "Squeeze lemon juice on apple slices to keep them from browning. Works for hours if you're packing them for a hike.",
            safetyNote: "Check for nut allergies before serving.",
            dietaryTags: [.vegetarian, .vegan, .glutenFree, .dairyFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-023",
            name: "Guacamole & Chips",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Fresh guacamole tastes better at camp. Something about being outside makes it work.",
            ingredients: [
                Ingredient(name: "ripe avocados", amount: "3", scalable: true, category: .produce),
                Ingredient(name: "lime juice", amount: "2 tbsp", scalable: false, category: .produce),
                Ingredient(name: "diced tomato", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "diced red onion", amount: "1/4 cup", scalable: true, category: .produce),
                Ingredient(name: "cilantro, chopped", amount: "2 tbsp", scalable: false, category: .produce),
                Ingredient(name: "salt", amount: "1/2 tsp", scalable: false, category: .spices),
                Ingredient(name: "tortilla chips", amount: "1 bag", scalable: true, category: .pantry)
            ],
            equipment: ["bowl", "fork", "knife"],
            steps: [
                "Cut avocados in half, remove pits, and scoop flesh into a bowl.",
                "Mash avocados with a fork until mostly smooth.",
                "Stir in lime juice, tomato, onion, cilantro, and salt.",
                "Mix well and serve with tortilla chips."
            ],
            proTip: "Press plastic wrap directly onto the surface of leftover guacamole to keep it from turning brown. Squeeze out the air bubbles.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.quickMeals, .ultralight, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-024",
            name: "Cobb Salad",
            cookingMethod: .noCook,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Use pre-cooked bacon and hard-boiled eggs from home. Still feels like a real meal even though you didn't cook it.",
            ingredients: [
                Ingredient(name: "romaine lettuce, chopped", amount: "4 cups", scalable: true, category: .produce),
                Ingredient(name: "cooked chicken breast, diced", amount: "12 oz", scalable: true, category: .meat),
                Ingredient(name: "hard-boiled eggs, chopped (prep at home)", amount: "4", scalable: true, category: .meat),
                Ingredient(name: "cooked bacon, crumbled", amount: "6 slices", scalable: true, category: .meat),
                Ingredient(name: "cherry tomatoes, halved", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "avocado, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "blue cheese, crumbled", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "ranch dressing", amount: "1/2 cup", scalable: true, category: .pantry)
            ],
            equipment: ["large bowl", "knife", "cutting board"],
            steps: [
                "Arrange lettuce in a large bowl or on plates.",
                "Top with rows of chicken, eggs, bacon, tomatoes, avocado, and blue cheese.",
                "Drizzle with ranch dressing before serving."
            ],
            proTip: "Hard-boil eggs at home and keep them in the shell until you're ready to use them. They last a week in the cooler that way.",
            safetyNote: nil,
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.quickMeals, .ultralight],
            isPremium: true
        ),

        Recipe(
            id: "nocook-025",
            name: "Chocolate Banana Bites",
            cookingMethod: .noCook,
            mealType: .dessert,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Freeze these at home and pack them in the cooler. They'll thaw just enough by dessert time.",
            ingredients: [
                Ingredient(name: "bananas", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "chocolate chips", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "peanut butter", amount: "1/4 cup", scalable: true, category: .pantry),
                Ingredient(name: "crushed graham crackers (optional)", amount: "1/4 cup", scalable: false, category: .pantry)
            ],
            equipment: ["knife", "parchment paper"],
            steps: [
                "Slice bananas into 1-inch rounds.",
                "Spread peanut butter on half the slices.",
                "Top with another banana slice to make sandwiches.",
                "Melt chocolate chips and drizzle over banana bites.",
                "Sprinkle with crushed graham crackers if using.",
                "Freeze at home before packing."
            ],
            proTip: "Pack frozen treats at the bottom of your cooler under the ice. They'll stay cold and help keep everything else chilled.",
            safetyNote: "Check for nut allergies before serving.",
            dietaryTags: [.vegetarian],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-026",
            name: "Antipasto Plate",
            cookingMethod: .noCook,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Pack all the components and assemble at camp. No cooking, but it feels like a proper dinner.",
            ingredients: [
                Ingredient(name: "salami, sliced", amount: "8 oz", scalable: true, category: .meat),
                Ingredient(name: "prosciutto, sliced", amount: "4 oz", scalable: true, category: .meat),
                Ingredient(name: "mozzarella balls", amount: "8 oz", scalable: true, category: .dairy),
                Ingredient(name: "marinated artichoke hearts", amount: "1 cup", scalable: true, category: .canned),
                Ingredient(name: "olives", amount: "1 cup", scalable: true, category: .canned),
                Ingredient(name: "roasted red peppers", amount: "1 cup", scalable: true, category: .canned),
                Ingredient(name: "crackers or bread", amount: "for serving", scalable: false, category: .bread)
            ],
            equipment: ["plate or cutting board"],
            steps: [
                "Arrange salami and prosciutto on a plate.",
                "Add mozzarella balls, artichoke hearts, olives, and peppers.",
                "Serve with crackers or bread on the side."
            ],
            proTip: "Drain marinated items before packing them in containers. Saves weight and they won't leak oil all over your cooler.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.quickMeals, .ultralight],
            isPremium: true
        ),

        Recipe(
            id: "nocook-027",
            name: "Iced Lemonade",
            cookingMethod: .noCook,
            mealType: .drink,
            prepTime: 5,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Mix lemonade from powder or fresh lemons. Either way works when it's hot outside.",
            ingredients: [
                Ingredient(name: "lemon juice", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "sugar", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "cold water", amount: "4 cups", scalable: true, category: .drinks),
                Ingredient(name: "ice", amount: "as needed", scalable: false, category: .other)
            ],
            equipment: ["pitcher or large container", "spoon"],
            steps: [
                "Combine lemon juice, sugar, and water in a pitcher.",
                "Stir until sugar is dissolved.",
                "Add ice and stir again.",
                "Serve."
            ],
            proTip: "Freeze lemon juice in ice cube trays at home. Use them instead of regular ice to keep lemonade cold without watering it down.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-028",
            name: "Banana Pudding Cups",
            cookingMethod: .noCook,
            mealType: .dessert,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Layer vanilla wafers, pudding, and bananas in a cup. Tastes like summer camp in the best way.",
            ingredients: [
                Ingredient(name: "instant vanilla pudding mix", amount: "1 box", scalable: true, category: .pantry),
                Ingredient(name: "cold milk", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "vanilla wafers", amount: "1 box", scalable: true, category: .pantry),
                Ingredient(name: "bananas, sliced", amount: "3", scalable: true, category: .produce)
            ],
            equipment: ["bowl", "whisk", "cups"],
            steps: [
                "Prepare pudding according to package directions using cold milk.",
                "Let pudding set for 5 minutes.",
                "Layer vanilla wafers, pudding, and banana slices in cups.",
                "Repeat layers until cups are full.",
                "Serve immediately or chill in the cooler."
            ],
            proTip: "Keep pudding mix and powdered milk in your camp pantry. You can make dessert without using up precious cooler space for fresh milk.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.quickMeals, .ultralight, .bikepacking, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-029",
            name: "Charcuterie Board",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 15,
            cookTime: 0,
            servings: 4,
            difficulty: .medium,
            introduction: "A spread for when you're in no rush. Arrange it on a cutting board and graze all afternoon.",
            ingredients: [
                Ingredient(name: "assorted cured meats", amount: "12 oz", scalable: true, category: .meat),
                Ingredient(name: "assorted cheeses", amount: "12 oz", scalable: true, category: .dairy),
                Ingredient(name: "crackers", amount: "1 box", scalable: true, category: .pantry),
                Ingredient(name: "grapes or berries", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "nuts", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "olives", amount: "1 cup", scalable: true, category: .canned),
                Ingredient(name: "honey or jam (optional)", amount: "for serving", scalable: false, category: .pantry)
            ],
            equipment: ["cutting board or large plate", "small bowls"],
            steps: [
                "Arrange meats and cheeses on a board.",
                "Place crackers around the edges.",
                "Fill in gaps with grapes, nuts, and olives.",
                "Add small bowls of honey or jam if using.",
                "Serve and let everyone assemble their own bites."
            ],
            proTip: "Bring a bandana to cover your board between grazing sessions. Keeps the flies off and the food fresh without using plastic wrap.",
            safetyNote: nil,
            dietaryTags: [],
            tags: [.quickMeals, .ultralight],
            isPremium: true
        ),

        Recipe(
            id: "nocook-030",
            name: "Cucumber Sandwiches",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Light and crisp. Good for hot afternoons when heavy food doesn't sound appealing.",
            ingredients: [
                Ingredient(name: "white or wheat bread", amount: "8 slices", scalable: true, category: .bread),
                Ingredient(name: "cream cheese, softened", amount: "8 oz", scalable: true, category: .dairy),
                Ingredient(name: "cucumber, sliced thin", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "fresh dill, chopped (optional)", amount: "2 tbsp", scalable: false, category: .produce),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["knife", "cutting board"],
            steps: [
                "Spread cream cheese on all bread slices.",
                "Layer cucumber slices on half the bread.",
                "Sprinkle with dill, salt, and pepper.",
                "Top with remaining bread slices.",
                "Cut sandwiches in half and serve."
            ],
            proTip: "Store cucumbers in the coldest part of the cooler wrapped in paper towels. They'll stay crisp for days instead of getting soft and soggy.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.quickMeals, .ultralight, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "nocook-031",
            name: "Walking Tacos",
            cookingMethod: .noCook,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 0,
            servings: 4,
            difficulty: .easy,
            introduction: "Crush the chips in the bag, pile taco toppings on top, and eat with a fork. Zero dishes, maximum fun.",
            ingredients: [
                Ingredient(name: "individual Fritos or Doritos bags", amount: "4", scalable: true, category: .pantry),
                Ingredient(name: "cooked taco meat (prep at home)", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "shredded cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "shredded lettuce", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "diced tomatoes", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "sour cream", amount: "1/2 cup", scalable: false, category: .dairy),
                Ingredient(name: "salsa", amount: "1/2 cup", scalable: false, category: .pantry)
            ],
            equipment: ["forks"],
            steps: [
                "Cook and season taco meat at home. Store in a sealed container in the cooler.",
                "When ready to eat, crush the chips slightly inside each bag.",
                "Open the bags and spoon warm or cold taco meat on top of the chips.",
                "Add cheese, lettuce, tomatoes, sour cream, and salsa.",
                "Eat directly from the bag with a fork."
            ],
            proTip: "Bring the taco meat in a thermos if you want it hot. A wide-mouth thermos keeps it warm for hours without needing a fire.",
            safetyNote: nil,
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "nocook-032",
            name: "Cowboy Caviar",
            cookingMethod: .noCook,
            mealType: .snack,
            prepTime: 15,
            cookTime: 0,
            servings: 6,
            difficulty: .easy,
            introduction: "A cold bean and corn salad with a zesty lime dressing. Make it at home and it gets better every day in the cooler.",
            ingredients: [
                Ingredient(name: "canned black beans, drained", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "canned black-eyed peas, drained", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "canned corn, drained", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "bell pepper, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "red onion, diced", amount: "1/2", scalable: true, category: .produce),
                Ingredient(name: "jalapeno, diced", amount: "1", scalable: false, category: .produce),
                Ingredient(name: "cilantro, chopped", amount: "1/4 cup", scalable: false, category: .produce),
                Ingredient(name: "lime juice", amount: "3 tablespoons", scalable: false, category: .produce),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt and cumin", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "tortilla chips", amount: "1 bag", scalable: true, category: .pantry)
            ],
            equipment: ["large bowl", "spoon"],
            steps: [
                "Drain and rinse beans, black-eyed peas, and corn.",
                "Combine everything in a large bowl.",
                "Add bell pepper, onion, jalapeno, and cilantro.",
                "Drizzle with lime juice and olive oil. Season with salt and cumin.",
                "Toss well to combine. Serve with tortilla chips.",
                "Tastes even better after a few hours in the cooler."
            ],
            proTip: "Mix this at home the night before and pack it in a sealed container. The flavors marry in the cooler and it's ready to eat the second you arrive at camp.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly, .quickMeals],
            isPremium: true
        )
    ]
}
