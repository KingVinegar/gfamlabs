import Foundation

extension RecipeDatabase {
    static let campStoveRecipes: [Recipe] = [
        // MARK: - Free Recipes (4)

        Recipe(
            id: "stove-quesadillas",
            name: "Camp Quesadillas",
            cookingMethod: .campStove,
            mealType: .lunch,
            prepTime: 5,
            cookTime: 10,
            servings: 4,
            difficulty: .easy,
            introduction: "Fast, filling, and works with whatever you have. Good for using up leftovers.",
            ingredients: [
                Ingredient(name: "flour tortillas", amount: "8 large", scalable: true, category: .bread),
                Ingredient(name: "shredded cheese", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "cooked chicken or beans", amount: "1 cup (optional)", scalable: true, category: .meat),
                Ingredient(name: "vegetable oil", amount: "for brushing", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "skillet", "spatula"],
            steps: [
                "Heat a lightly oiled skillet over medium heat.",
                "Place one tortilla in the pan.",
                "Sprinkle with 1/2 cup cheese and any fillings on half the tortilla.",
                "Fold tortilla in half.",
                "Cook 2-3 minutes per side until golden and cheese melts.",
                "Remove and keep warm while making remaining quesadillas.",
                "Cut into wedges and serve."
            ],
            proTip: "Leftover chili, scrambled eggs, or cooked bacon all work great as fillings.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot],
            isPremium: false
        ),

        Recipe(
            id: "stove-instant-ramen-upgrade",
            name: "Upgraded Ramen",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 10,
            servings: 2,
            difficulty: .easy,
            introduction: "Turn cheap instant ramen into something actually filling. Good for a quick solo dinner.",
            ingredients: [
                Ingredient(name: "instant ramen", amount: "2 packages", scalable: true, category: .pantry),
                Ingredient(name: "eggs", amount: "2", scalable: true, category: .meat),
                Ingredient(name: "green onions, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "soy sauce", amount: "1 tablespoon", scalable: true, category: .pantry),
                Ingredient(name: "sesame oil", amount: "1 teaspoon", scalable: true, category: .pantry)
            ],
            equipment: ["camp stove", "pot"],
            steps: [
                "Bring 4 cups water to a boil in the pot.",
                "Add ramen noodles and cook 3 minutes.",
                "Crack eggs directly into the boiling water.",
                "Stir gently and cook 2 more minutes.",
                "Remove from heat and stir in seasoning packets, soy sauce, and sesame oil.",
                "Top with green onions and serve."
            ],
            proTip: "Add any leftover cooked meat, vegetables, or hot sauce you have around camp.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.quickMeals, .onePot, .ultralight, .winterCamping, .bikepacking],
            isPremium: false
        ),

        Recipe(
            id: "stove-oatmeal",
            name: "Camp Oatmeal",
            cookingMethod: .campStove,
            mealType: .breakfast,
            prepTime: 2,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "Warm, filling, and easy to customize. Bring a bag of old-fashioned oats and dress it up however you like.",
            ingredients: [
                Ingredient(name: "old-fashioned oats", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "water", amount: "4 cups", scalable: true, category: .drinks),
                Ingredient(name: "salt", amount: "1/2 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "brown sugar or honey", amount: "to taste", scalable: false, category: .pantry),
                Ingredient(name: "dried fruit, nuts, or cinnamon", amount: "optional", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "pot"],
            steps: [
                "Bring water and salt to a boil in the pot.",
                "Stir in oats.",
                "Reduce heat to low and simmer 5 minutes, stirring occasionally.",
                "Remove from heat and let sit 2 minutes to thicken.",
                "Stir in brown sugar and any toppings.",
                "Serve warm."
            ],
            proTip: "Pre-portion oats with dried fruit and cinnamon in bags at home. One less thing to measure.",
            safetyNote: nil,
            dietaryTags: [.vegan, .dairyFree, .vegetarian],
            tags: [.quickMeals, .onePot, .ultralight, .winterCamping, .bikepacking],
            isPremium: false
        ),

        Recipe(
            id: "stove-hot-dogs",
            name: "Boiled Hot Dogs",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 2,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "Sometimes you just want a simple hot dog. This works when the fire isn't going yet.",
            ingredients: [
                Ingredient(name: "hot dogs", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "hot dog buns", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "water", amount: "enough to cover", scalable: false, category: .drinks),
                Ingredient(name: "condiments", amount: "as desired", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "pot"],
            steps: [
                "Fill pot with enough water to cover hot dogs.",
                "Bring water to a boil over high heat.",
                "Add hot dogs and reduce heat to medium.",
                "Simmer 5-7 minutes until hot dogs are heated through.",
                "Remove with tongs and place in buns.",
                "Add condiments and serve."
            ],
            proTip: "Save the hot dog water and use it to warm the buns. Just dip them in for a few seconds.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot],
            isPremium: false
        ),

        // MARK: - Premium Recipes (19)

        Recipe(
            id: "stove-breakfast-burritos",
            name: "Breakfast Burritos",
            cookingMethod: .campStove,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .medium,
            introduction: "Cook everything in one pan, then wrap it up. These hold heat well if you're hitting the trail early.",
            ingredients: [
                Ingredient(name: "eggs", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "breakfast sausage", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "bell pepper, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "onion, diced", amount: "1 small", scalable: true, category: .produce),
                Ingredient(name: "shredded cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "flour tortillas", amount: "4 large", scalable: true, category: .bread),
                Ingredient(name: "salsa", amount: "for serving", scalable: false, category: .pantry),
                Ingredient(name: "vegetable oil", amount: "1 tablespoon", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "large skillet"],
            steps: [
                "Heat oil in the skillet over medium heat.",
                "Add sausage and cook 6-8 minutes, breaking it up, until browned.",
                "Add pepper and onion. Cook 4 minutes until soft.",
                "Beat eggs in a bowl and pour into the skillet.",
                "Scramble everything together 3-4 minutes until eggs are cooked.",
                "Warm tortillas in the pan for 30 seconds each.",
                "Divide filling among tortillas, top with cheese and salsa.",
                "Roll up burritos and serve."
            ],
            proTip: "Wrap finished burritos in foil and keep them near the stove. They'll stay warm for 30 minutes.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-beef-stroganoff",
            name: "Camp Stroganoff",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 25,
            servings: 4,
            difficulty: .medium,
            introduction: "Creamy comfort food that works over a camp stove. Use egg noodles for the traditional version.",
            ingredients: [
                Ingredient(name: "egg noodles", amount: "12 oz", scalable: true, category: .pantry),
                Ingredient(name: "beef sirloin, sliced thin", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "mushrooms, sliced", amount: "8 oz", scalable: true, category: .produce),
                Ingredient(name: "onion, diced", amount: "1 medium", scalable: true, category: .produce),
                Ingredient(name: "sour cream", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "beef broth", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "flour", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "butter", amount: "3 tablespoons", scalable: false, category: .dairy),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["camp stove", "large pot", "skillet"],
            steps: [
                "Bring a pot of salted water to a boil and cook noodles according to package directions. Drain and set aside.",
                "Heat 1 tablespoon butter in the skillet over medium-high heat.",
                "Season beef with salt and pepper, then cook 3-4 minutes until browned. Remove and set aside.",
                "Add remaining butter to the pan with mushrooms and onion.",
                "Cook 5 minutes until vegetables soften.",
                "Sprinkle flour over vegetables and stir for 1 minute.",
                "Add beef broth and bring to a simmer, stirring until thickened.",
                "Return beef to the pan and stir in sour cream.",
                "Heat through but don't boil. Serve over noodles."
            ],
            proTip: "Keep the sour cream in the coldest part of your cooler and use it for the first night's dinner.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.winterCamping, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "stove-fried-rice",
            name: "Camp Fried Rice",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 15,
            servings: 4,
            difficulty: .medium,
            introduction: "Cook rice at home and bring it cold. Day-old rice makes the best fried rice.",
            ingredients: [
                Ingredient(name: "cooked rice, cold", amount: "4 cups", scalable: true, category: .pantry),
                Ingredient(name: "eggs", amount: "3", scalable: true, category: .meat),
                Ingredient(name: "frozen mixed vegetables", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "cooked ham or spam, diced", amount: "1 cup", scalable: true, category: .meat),
                Ingredient(name: "soy sauce", amount: "3 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "sesame oil", amount: "2 teaspoons", scalable: true, category: .pantry),
                Ingredient(name: "vegetable oil", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "green onions, sliced", amount: "3", scalable: true, category: .produce)
            ],
            equipment: ["camp stove", "large skillet or wok"],
            steps: [
                "Heat 1 tablespoon oil in the skillet over medium-high heat.",
                "Scramble eggs 2 minutes until just cooked. Remove and set aside.",
                "Add remaining oil to the pan with ham and vegetables.",
                "Stir-fry 3-4 minutes until vegetables are heated through.",
                "Add cold rice, breaking up any clumps.",
                "Cook 5 minutes, stirring occasionally, until rice is hot.",
                "Add soy sauce, sesame oil, and scrambled eggs.",
                "Toss everything together for 1 minute.",
                "Top with green onions and serve."
            ],
            proTip: "This is the perfect recipe for using up leftover rice from another meal. Fresh rice gets mushy.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-shrimp-boil",
            name: "Camp Shrimp Boil",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 20,
            servings: 6,
            difficulty: .medium,
            introduction: "Everything cooks in one big pot. Dump it out on a table covered with newspaper for the full experience.",
            ingredients: [
                Ingredient(name: "small red potatoes", amount: "2 lbs", scalable: true, category: .produce),
                Ingredient(name: "corn on the cob, halved", amount: "4 ears", scalable: true, category: .produce),
                Ingredient(name: "smoked sausage, cut in chunks", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "large shrimp, shell-on", amount: "2 lbs", scalable: true, category: .meat),
                Ingredient(name: "Old Bay seasoning", amount: "1/4 cup", scalable: true, category: .spices),
                Ingredient(name: "butter, melted", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "lemon wedges", amount: "for serving", scalable: false, category: .produce)
            ],
            equipment: ["camp stove", "large pot with lid"],
            steps: [
                "Fill pot with water and add Old Bay seasoning.",
                "Bring to a boil over high heat.",
                "Add potatoes and boil 10 minutes.",
                "Add corn and sausage. Boil 5 minutes.",
                "Add shrimp and cook 3-4 minutes until pink and cooked through.",
                "Drain everything into a colander.",
                "Dump onto a newspaper-covered table or into large bowls.",
                "Drizzle with melted butter and serve with lemon wedges."
            ],
            proTip: "Bring frozen shrimp in a sealed bag. They'll thaw in the cooler and help keep everything else cold.",
            safetyNote: "Keep raw shrimp separate from other food until cooking. Wash hands after handling.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-chicken-tacos",
            name: "Chicken Tacos",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .easy,
            introduction: "Season chicken at home in a bag. At camp it's just cook and assemble.",
            ingredients: [
                Ingredient(name: "chicken breast, diced", amount: "1 1/2 lbs", scalable: true, category: .meat),
                Ingredient(name: "taco seasoning", amount: "2 tablespoons", scalable: true, category: .spices),
                Ingredient(name: "taco shells or tortillas", amount: "12", scalable: true, category: .bread),
                Ingredient(name: "shredded lettuce", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "shredded cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "salsa", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "sour cream", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "skillet"],
            steps: [
                "Toss chicken with taco seasoning in a bowl or bag.",
                "Heat oil in the skillet over medium-high heat.",
                "Add chicken and cook 8-10 minutes, stirring occasionally, until cooked through and no longer pink.",
                "Warm taco shells in the pan for 30 seconds each.",
                "Fill shells with chicken, lettuce, cheese, salsa, and sour cream.",
                "Serve immediately."
            ],
            proTip: "Toss citrus peels into the fire after eating. The oils help keep mosquitoes back.",
            safetyNote: "Make sure chicken is cooked all the way through with no pink remaining.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-pasta-marinara",
            name: "Pasta Marinara",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "Simple pasta that works every time. Add cooked sausage or ground beef if you want meat.",
            ingredients: [
                Ingredient(name: "pasta", amount: "1 lb", scalable: true, category: .pantry),
                Ingredient(name: "marinara sauce", amount: "1 jar (24 oz)", scalable: true, category: .pantry),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: true, category: .produce),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "Italian seasoning", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "parmesan cheese", amount: "for serving", scalable: false, category: .dairy)
            ],
            equipment: ["camp stove", "large pot", "small pot"],
            steps: [
                "Bring a large pot of salted water to a boil.",
                "Add pasta and cook according to package directions. Drain.",
                "While pasta cooks, heat olive oil in a small pot over medium heat.",
                "Add garlic and cook 30 seconds until fragrant.",
                "Add marinara sauce and Italian seasoning.",
                "Simmer 5 minutes, stirring occasionally.",
                "Toss pasta with sauce.",
                "Serve with parmesan cheese."
            ],
            proTip: "If you're cooking with garlic, rub a cut clove on mosquito bites. Takes the itch out.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "stove-beans-rice",
            name: "Beans and Rice",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 30,
            servings: 4,
            difficulty: .easy,
            introduction: "A camp staple that's cheap, filling, and vegetarian. Dress it up with whatever toppings you have.",
            ingredients: [
                Ingredient(name: "white rice", amount: "1 1/2 cups", scalable: true, category: .pantry),
                Ingredient(name: "water", amount: "3 cups", scalable: true, category: .drinks),
                Ingredient(name: "canned black beans", amount: "2 cans (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "salsa", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "cumin", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "shredded cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "salt", amount: "1/2 teaspoon", scalable: true, category: .spices)
            ],
            equipment: ["camp stove", "pot with lid", "small pot"],
            steps: [
                "Bring water and salt to a boil in the pot.",
                "Add rice, reduce heat to low, and cover.",
                "Simmer 20 minutes until water is absorbed. Remove from heat.",
                "While rice cooks, heat beans with their liquid in the small pot over medium heat.",
                "Add salsa and cumin to beans.",
                "Simmer 10 minutes, stirring occasionally.",
                "Serve beans over rice, topped with cheese."
            ],
            proTip: "Bring instant rice instead if you want this done in 10 minutes total. Not traditional but it works.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.winterCamping, .familyFriendly, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "stove-chili-mac",
            name: "Chili Mac",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 5,
            cookTime: 25,
            servings: 6,
            difficulty: .easy,
            introduction: "Mix chili with macaroni and you've got a meal that'll fuel you for hours. Kids love this one.",
            ingredients: [
                Ingredient(name: "elbow macaroni", amount: "1 lb", scalable: true, category: .pantry),
                Ingredient(name: "ground beef", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "canned kidney beans", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "canned diced tomatoes", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "chili powder", amount: "2 tablespoons", scalable: true, category: .spices),
                Ingredient(name: "shredded cheddar cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "salt", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["camp stove", "large pot"],
            steps: [
                "Bring a pot of salted water to a boil.",
                "Cook macaroni according to package directions. Drain and set aside.",
                "In the same pot, brown ground beef over medium heat, 6-8 minutes.",
                "Drain excess fat.",
                "Add tomatoes, beans with their liquid, and chili powder.",
                "Simmer 10 minutes.",
                "Stir in cooked macaroni.",
                "Top with cheese and let it melt before serving."
            ],
            proTip: "Make this even easier by bringing pre-cooked ground beef frozen. Just add it to the pot and heat through.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.onePot, .winterCamping, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "stove-breakfast-potatoes",
            name: "Breakfast Potatoes",
            cookingMethod: .campStove,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .medium,
            introduction: "Cut the potatoes small so they cook faster. Season well and let them get crispy.",
            ingredients: [
                Ingredient(name: "russet potatoes, diced", amount: "4 large", scalable: true, category: .produce),
                Ingredient(name: "bell pepper, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "onion, diced", amount: "1 medium", scalable: true, category: .produce),
                Ingredient(name: "vegetable oil", amount: "3 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "paprika", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "garlic powder", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["camp stove", "large skillet with lid"],
            steps: [
                "Heat oil in the skillet over medium-high heat.",
                "Add potatoes and season with paprika, garlic powder, salt, and pepper.",
                "Cover and cook 10 minutes, stirring every 3 minutes.",
                "Add pepper and onion.",
                "Cook uncovered 8-10 more minutes, stirring occasionally, until potatoes are golden and tender.",
                "Serve hot."
            ],
            proTip: "Parboil potatoes at home for 5 minutes, then cool. They'll cook way faster at camp.",
            safetyNote: nil,
            dietaryTags: [.vegan, .glutenFree, .dairyFree, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-sloppy-joes",
            name: "Sloppy Joes",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 20,
            servings: 6,
            difficulty: .easy,
            introduction: "Sweet and tangy ground beef on buns. Easy to scale up for a big group.",
            ingredients: [
                Ingredient(name: "ground beef", amount: "2 lbs", scalable: true, category: .meat),
                Ingredient(name: "onion, diced", amount: "1 medium", scalable: true, category: .produce),
                Ingredient(name: "green bell pepper, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "tomato sauce", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "ketchup", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "brown sugar", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "worcestershire sauce", amount: "1 tablespoon", scalable: true, category: .pantry),
                Ingredient(name: "hamburger buns", amount: "6", scalable: true, category: .bread)
            ],
            equipment: ["camp stove", "large skillet"],
            steps: [
                "Brown ground beef in the skillet over medium-high heat, 6-8 minutes.",
                "Drain excess fat.",
                "Add onion and pepper. Cook 5 minutes until soft.",
                "Stir in tomato sauce, ketchup, brown sugar, and worcestershire sauce.",
                "Reduce heat and simmer 10 minutes, stirring occasionally.",
                "Serve on buns."
            ],
            proTip: "Make the meat mixture ahead and reheat at camp. Saves cleanup when you're tired.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-corn-chowder",
            name: "Corn Chowder",
            cookingMethod: .campStove,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 25,
            servings: 6,
            difficulty: .medium,
            introduction: "A creamy soup that's filling enough for lunch or a light dinner. Good for cool evenings.",
            ingredients: [
                Ingredient(name: "bacon, chopped", amount: "6 slices", scalable: true, category: .meat),
                Ingredient(name: "onion, diced", amount: "1 medium", scalable: true, category: .produce),
                Ingredient(name: "potatoes, diced", amount: "3 medium", scalable: true, category: .produce),
                Ingredient(name: "corn kernels (frozen or canned)", amount: "3 cups", scalable: true, category: .produce),
                Ingredient(name: "chicken broth", amount: "3 cups", scalable: true, category: .pantry),
                Ingredient(name: "heavy cream", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "flour", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["camp stove", "large pot"],
            steps: [
                "Cook bacon in the pot over medium heat until crispy. Remove and set aside.",
                "Add onion to bacon fat and cook 3 minutes.",
                "Sprinkle flour over onion and stir for 1 minute.",
                "Add potatoes and broth. Bring to a boil.",
                "Reduce heat and simmer 15 minutes until potatoes are tender.",
                "Add corn and cream. Heat through but don't boil.",
                "Season with salt and pepper.",
                "Top with crumbled bacon and serve."
            ],
            proTip: "Save the bacon grease in a tin. It's the best fire starter you'll ever have.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.onePot, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "stove-chicken-noodle-soup",
            name: "Chicken Noodle Soup",
            cookingMethod: .campStove,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 25,
            servings: 6,
            difficulty: .easy,
            introduction: "Nothing beats homemade chicken soup. Bring rotisserie chicken to save time.",
            ingredients: [
                Ingredient(name: "cooked chicken, shredded", amount: "2 cups", scalable: true, category: .meat),
                Ingredient(name: "egg noodles", amount: "8 oz", scalable: true, category: .pantry),
                Ingredient(name: "carrots, sliced", amount: "3", scalable: true, category: .produce),
                Ingredient(name: "celery, sliced", amount: "3 stalks", scalable: true, category: .produce),
                Ingredient(name: "onion, diced", amount: "1 medium", scalable: true, category: .produce),
                Ingredient(name: "chicken broth", amount: "8 cups", scalable: true, category: .pantry),
                Ingredient(name: "bay leaf", amount: "1", scalable: false, category: .spices),
                Ingredient(name: "dried thyme", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "vegetable oil", amount: "1 tablespoon", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "large pot"],
            steps: [
                "Heat oil in the pot over medium heat.",
                "Add onion, carrots, and celery. Cook 5 minutes until starting to soften.",
                "Add broth, bay leaf, and thyme. Bring to a boil.",
                "Add noodles and reduce heat to medium.",
                "Simmer 8-10 minutes until noodles are tender.",
                "Add chicken and heat through, about 3 minutes.",
                "Remove bay leaf. Season with salt and pepper.",
                "Serve hot."
            ],
            proTip: "Cook the noodles separately if you're making this ahead. They'll soak up all the broth otherwise.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.onePot, .winterCamping, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "stove-shakshuka",
            name: "Shakshuka",
            cookingMethod: .campStove,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .medium,
            introduction: "Eggs poached in spiced tomato sauce. Serve with bread for dipping.",
            ingredients: [
                Ingredient(name: "canned diced tomatoes", amount: "1 can (28 oz)", scalable: true, category: .canned),
                Ingredient(name: "onion, diced", amount: "1 medium", scalable: true, category: .produce),
                Ingredient(name: "bell pepper, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: true, category: .produce),
                Ingredient(name: "eggs", amount: "6", scalable: true, category: .meat),
                Ingredient(name: "cumin", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "paprika", amount: "1 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "bread for serving", amount: "optional", scalable: false, category: .bread)
            ],
            equipment: ["camp stove", "large skillet with lid"],
            steps: [
                "Heat oil in the skillet over medium heat.",
                "Add onion and pepper. Cook 5 minutes until soft.",
                "Add garlic, cumin, and paprika. Cook 1 minute.",
                "Add tomatoes with their juice. Simmer 10 minutes until slightly thickened.",
                "Season sauce with salt and pepper.",
                "Make 6 wells in the sauce and crack an egg into each.",
                "Cover and cook 5-7 minutes until egg whites are set but yolks are still runny.",
                "Serve with bread for dipping."
            ],
            proTip: "This works for breakfast, lunch, or dinner. It's one of those recipes that fits anywhere.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .dairyFree, .nutFree],
            tags: [.onePot, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "stove-campfire-chili-cheese-dogs",
            name: "Chili Cheese Dogs",
            cookingMethod: .campStove,
            mealType: .snack,
            prepTime: 5,
            cookTime: 15,
            servings: 6,
            difficulty: .easy,
            introduction: "Hot dogs topped with leftover chili. Use canned chili if you don't have leftovers.",
            ingredients: [
                Ingredient(name: "hot dogs", amount: "6", scalable: true, category: .meat),
                Ingredient(name: "hot dog buns", amount: "6", scalable: true, category: .bread),
                Ingredient(name: "canned chili", amount: "1 can (15 oz)", scalable: true, category: .canned),
                Ingredient(name: "shredded cheddar cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "diced onion", amount: "1/4 cup (optional)", scalable: true, category: .produce)
            ],
            equipment: ["camp stove", "pot", "small pan"],
            steps: [
                "Bring water to a boil in the pot.",
                "Add hot dogs and simmer 5-7 minutes.",
                "While hot dogs cook, heat chili in the small pan over medium heat.",
                "Remove hot dogs with tongs and place in buns.",
                "Top each with chili and cheese.",
                "Add diced onion if using.",
                "Serve immediately."
            ],
            proTip: "Heat the buns cut-side down in a dry pan for 30 seconds. Makes them way better.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.familyFriendly, .quickMeals],
            isPremium: true
        ),

        Recipe(
            id: "stove-instant-mashed-potatoes",
            name: "Camp Mashed Potatoes",
            cookingMethod: .campStove,
            mealType: .snack,
            prepTime: 2,
            cookTime: 8,
            servings: 4,
            difficulty: .easy,
            introduction: "Instant mashed potatoes are perfect for camp. Add butter and cheese to make them better.",
            ingredients: [
                Ingredient(name: "instant mashed potatoes", amount: "4 servings", scalable: true, category: .pantry),
                Ingredient(name: "water", amount: "per package directions", scalable: true, category: .drinks),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: true, category: .dairy),
                Ingredient(name: "milk powder or milk", amount: "per package directions", scalable: true, category: .dairy),
                Ingredient(name: "shredded cheese", amount: "1/2 cup (optional)", scalable: true, category: .dairy),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["camp stove", "pot"],
            steps: [
                "Bring water to a boil in the pot according to package directions.",
                "Remove from heat and stir in instant potatoes and milk powder.",
                "Add butter and stir until melted.",
                "Mix in cheese if using.",
                "Season with salt and pepper.",
                "Let sit 1 minute to thicken.",
                "Serve hot."
            ],
            proTip: "These are great as a side dish or mixed into scrambled eggs for loaded breakfast potatoes.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .glutenFree, .nutFree],
            tags: [.familyFriendly, .quickMeals, .onePot, .ultralight, .bikepacking],
            isPremium: true
        ),

        Recipe(
            id: "stove-smore-pancakes",
            name: "S'more Pancakes",
            cookingMethod: .campStove,
            mealType: .dessert,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .medium,
            introduction: "Pancakes with chocolate chips and marshmallows. Top with graham cracker crumbs for the full s'more experience.",
            ingredients: [
                Ingredient(name: "pancake mix", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "water or milk", amount: "per package directions", scalable: true, category: .dairy),
                Ingredient(name: "mini chocolate chips", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "mini marshmallows", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "graham crackers, crushed", amount: "1/2 cup", scalable: true, category: .pantry),
                Ingredient(name: "butter", amount: "for cooking", scalable: false, category: .dairy),
                Ingredient(name: "chocolate syrup", amount: "for topping", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "skillet", "spatula"],
            steps: [
                "Mix pancake batter according to package directions.",
                "Fold in chocolate chips and marshmallows.",
                "Heat butter in the skillet over medium heat.",
                "Pour 1/4 cup batter per pancake onto the hot surface.",
                "Cook 2-3 minutes until bubbles form.",
                "Flip and cook 2 more minutes.",
                "Stack pancakes on plates.",
                "Top with crushed graham crackers and chocolate syrup.",
                "Serve warm."
            ],
            proTip: "Crush the graham crackers in the package before opening. Saves bringing an extra bowl or bag.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-campfire-cobbler",
            name: "Skillet Cobbler",
            cookingMethod: .campStove,
            mealType: .dessert,
            prepTime: 5,
            cookTime: 20,
            servings: 6,
            difficulty: .medium,
            introduction: "Fruit and biscuit topping cooked in a skillet. Use any canned fruit you have.",
            ingredients: [
                Ingredient(name: "canned fruit pie filling", amount: "1 can (21 oz)", scalable: true, category: .canned),
                Ingredient(name: "biscuit mix", amount: "1 cup", scalable: true, category: .pantry),
                Ingredient(name: "milk or water", amount: "1/3 cup", scalable: true, category: .dairy),
                Ingredient(name: "sugar", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "butter", amount: "2 tablespoons", scalable: false, category: .dairy)
            ],
            equipment: ["camp stove", "skillet with lid"],
            steps: [
                "Pour fruit filling into the skillet and spread evenly.",
                "Heat over medium-low heat until bubbling.",
                "Mix biscuit mix, milk, and sugar in a bowl until just combined.",
                "Drop spoonfuls of biscuit dough over the hot fruit.",
                "Dot with butter.",
                "Cover and cook 15-18 minutes until biscuit topping is cooked through.",
                "Let cool 5 minutes before serving."
            ],
            proTip: "Keep the heat low and don't lift the lid. The biscuits steam and bake at the same time.",
            safetyNote: "Skillet handle will be very hot. Use a towel or pot holder.",
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .onePot],
            isPremium: true
        ),

        Recipe(
            id: "stove-thai-peanut-noodles",
            name: "Thai Peanut Noodles",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            difficulty: .medium,
            introduction: "A quick stir-fry with peanut sauce. Mix the sauce at home to save time at camp.",
            ingredients: [
                Ingredient(name: "spaghetti or rice noodles", amount: "12 oz", scalable: true, category: .pantry),
                Ingredient(name: "peanut butter", amount: "1/3 cup", scalable: true, category: .pantry),
                Ingredient(name: "soy sauce", amount: "3 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "rice vinegar", amount: "2 tablespoons", scalable: true, category: .pantry),
                Ingredient(name: "brown sugar", amount: "1 tablespoon", scalable: true, category: .pantry),
                Ingredient(name: "garlic powder", amount: "1/2 teaspoon", scalable: true, category: .spices),
                Ingredient(name: "hot water", amount: "1/4 cup", scalable: true, category: .drinks),
                Ingredient(name: "frozen vegetables", amount: "2 cups", scalable: true, category: .produce),
                Ingredient(name: "green onions, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "sesame oil", amount: "1 tablespoon", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "large pot"],
            steps: [
                "Bring a pot of water to a boil and cook noodles according to package directions. Drain.",
                "While noodles cook, whisk peanut butter, soy sauce, vinegar, sugar, garlic powder, and hot water in a bowl.",
                "Heat sesame oil in the same pot over medium heat.",
                "Add frozen vegetables and stir-fry 4-5 minutes until heated through.",
                "Return noodles to the pot and add peanut sauce.",
                "Toss everything together until well coated.",
                "Top with green onions and serve."
            ],
            proTip: "Rub the outside of the pot with dish soap before putting it over the fire. The soot wipes right off.",
            safetyNote: "This recipe contains peanuts. Not suitable for those with nut allergies.",
            dietaryTags: [.vegetarian, .vegan, .dairyFree],
            tags: [.onePot, .bikepacking, .quickMeals],
            isPremium: true
        ),

        Recipe(
            id: "stove-cajun-sausage-pasta",
            name: "Cajun Sausage Pasta",
            cookingMethod: .campStove,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .medium,
            introduction: "Spicy sausage with peppers and onions over pasta. Adjust the Cajun seasoning to your heat preference.",
            ingredients: [
                Ingredient(name: "penne pasta", amount: "12 oz", scalable: true, category: .pantry),
                Ingredient(name: "smoked sausage, sliced", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "bell peppers, sliced", amount: "2", scalable: true, category: .produce),
                Ingredient(name: "onion, sliced", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "heavy cream", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "Cajun seasoning", amount: "2 tablespoons", scalable: true, category: .spices),
                Ingredient(name: "parmesan cheese", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: ["camp stove", "large pot", "skillet"],
            steps: [
                "Bring a pot of salted water to a boil and cook pasta according to package directions. Drain.",
                "Heat oil in the skillet over medium-high heat.",
                "Add sausage and cook 5 minutes until browned.",
                "Add peppers and onions. Cook 5 minutes until soft.",
                "Stir in Cajun seasoning.",
                "Add cream and bring to a simmer.",
                "Add pasta and toss to coat.",
                "Stir in parmesan cheese.",
                "Serve hot."
            ],
            proTip: "Use the pasta water to thin the sauce if it gets too thick. Add a few tablespoons at a time.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.winterCamping, .bikepacking],
            isPremium: true
        )
    ]
}
