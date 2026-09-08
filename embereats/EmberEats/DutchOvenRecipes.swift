import Foundation

extension RecipeDatabase {
    static let dutchOvenRecipes: [Recipe] = [
        // FREE RECIPES (6)

        Recipe(
            id: "dutch-oven-scramble",
            name: "Breakfast Scramble",
            cookingMethod: .dutchOven,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "A hearty one-pot breakfast that feeds the whole crew. Get your coals ready the night before to make morning easier.",
            ingredients: [
                Ingredient(name: "eggs", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "breakfast sausage", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "potatoes, diced", amount: "3 cups", scalable: true, category: .produce),
                Ingredient(name: "bell pepper, chopped", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "onion, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "shredded cheese", amount: "1 cup", scalable: true, category: .dairy),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "wooden spoon"],
            steps: [
                "Set up 8 coals under the Dutch oven and 16 on the lid for 350°F heat.",
                "Heat oil in the Dutch oven. Add sausage and break it apart while cooking, about 5 minutes until browned.",
                "Add potatoes, onion, and bell pepper. Stir and cook 10 minutes until potatoes soften.",
                "Crack eggs directly into the pot. Stir everything together and cook 3-4 minutes until eggs are just set.",
                "Sprinkle cheese on top, replace lid for 1 minute to melt. Season with salt and pepper."
            ],
            proTip: "Keep a spray bottle of water nearby when cooking with charcoal. A quick spritz tames hot spots without killing the coal.",
            safetyNote: "Dutch oven handles and lids get extremely hot. Keep leather gloves or welding gloves in your camp kitchen.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.onePot, .familyFriendly, .winterCamping],
            isPremium: false
        ),

        Recipe(
            id: "dutch-oven-cornbread",
            name: "Cornbread",
            cookingMethod: .dutchOven,
            mealType: .snack,
            prepTime: 10,
            cookTime: 25,
            servings: 6,
            difficulty: .easy,
            introduction: "Nothing beats warm cornbread at camp. Mix the dry ingredients at home and you're halfway there.",
            ingredients: [
                Ingredient(name: "cornmeal", amount: "1 1/2 cups", scalable: false, category: .pantry),
                Ingredient(name: "all-purpose flour", amount: "1 1/2 cups", scalable: false, category: .pantry),
                Ingredient(name: "sugar", amount: "1/3 cup", scalable: false, category: .pantry),
                Ingredient(name: "baking powder", amount: "2 teaspoons", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "eggs", amount: "2", scalable: false, category: .meat),
                Ingredient(name: "milk", amount: "1 1/4 cups", scalable: false, category: .dairy),
                Ingredient(name: "butter, melted", amount: "1/3 cup", scalable: false, category: .dairy)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes", "parchment paper"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 375°F heat.",
                "Line the bottom of the Dutch oven with parchment paper. Grease the sides with butter.",
                "Mix cornmeal, flour, sugar, baking powder, and salt in a bowl.",
                "In another bowl, whisk together eggs, milk, and melted butter.",
                "Pour wet ingredients into dry and stir until just combined. Don't overmix.",
                "Pour batter into the Dutch oven. Cover and bake 20-25 minutes until a knife inserted in the center comes out clean.",
                "Lift lid carefully. Let cool 5 minutes before slicing."
            ],
            proTip: "Rotate the oven and lid in opposite directions every 10 minutes. Keeps the heat even and prevents hot spots from burning the edges.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.onePot, .familyFriendly, .campfireClassics],
            isPremium: false
        ),

        Recipe(
            id: "dutch-oven-chili",
            name: "Camp Chili",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 60,
            servings: 6,
            difficulty: .easy,
            introduction: "A classic camp dinner that gets better the longer it simmers. Make extra for chili dogs the next day.",
            ingredients: [
                Ingredient(name: "ground beef", amount: "2 lbs", scalable: true, category: .meat),
                Ingredient(name: "onion, diced", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "bell pepper, chopped", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: true, category: .produce),
                Ingredient(name: "kidney beans, drained", amount: "2 cans (15 oz each)", scalable: true, category: .canned),
                Ingredient(name: "diced tomatoes", amount: "1 can (28 oz)", scalable: true, category: .canned),
                Ingredient(name: "tomato paste", amount: "2 tablespoons", scalable: true, category: .canned),
                Ingredient(name: "chili powder", amount: "3 tablespoons", scalable: true, category: .spices),
                Ingredient(name: "cumin", amount: "1 tablespoon", scalable: true, category: .spices),
                Ingredient(name: "salt", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "shredded cheese for topping", amount: "optional", scalable: false, category: .dairy)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "wooden spoon"],
            steps: [
                "Set up 10 coals under the Dutch oven and 20 on the lid for 375°F heat.",
                "Brown ground beef in the Dutch oven, breaking it apart, about 8 minutes. Drain excess fat.",
                "Add onion, bell pepper, and garlic. Cook 5 minutes until vegetables soften.",
                "Stir in beans, diced tomatoes, tomato paste, chili powder, cumin, and salt.",
                "Cover and simmer 45-60 minutes, stirring every 15 minutes. Add water if it gets too thick.",
                "Taste and adjust seasoning. Serve topped with shredded cheese if desired."
            ],
            proTip: "Freeze the ground beef in a zip-lock before packing. It acts as an ice pack in your cooler and thaws by dinner.",
            safetyNote: "Keep raw meat separate from other food in your cooler. Wash hands and utensils thoroughly after handling.",
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.onePot, .winterCamping, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "dutch-oven-cobbler",
            name: "Peach Cobbler",
            cookingMethod: .dutchOven,
            mealType: .dessert,
            prepTime: 10,
            cookTime: 30,
            servings: 6,
            difficulty: .easy,
            introduction: "The camp dessert everyone remembers. Works with fresh, canned, or frozen fruit.",
            ingredients: [
                Ingredient(name: "canned peaches in syrup", amount: "2 cans (29 oz each)", scalable: false, category: .canned),
                Ingredient(name: "yellow cake mix", amount: "1 box", scalable: false, category: .pantry),
                Ingredient(name: "butter, melted", amount: "1/2 cup", scalable: false, category: .dairy),
                Ingredient(name: "cinnamon", amount: "1 teaspoon", scalable: false, category: .spices)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes"],
            steps: [
                "Set up 8 coals under the Dutch oven and 16 on the lid for 350°F heat.",
                "Pour peaches with syrup into the bottom of the Dutch oven. Spread evenly.",
                "Sprinkle dry cake mix over the peaches. Do not stir.",
                "Drizzle melted butter over the cake mix. Dust with cinnamon.",
                "Cover and bake 30 minutes until the top is golden and bubbling at the edges.",
                "Let cool 5 minutes before serving. Scoop into bowls."
            ],
            proTip: "Check the cobbler at 20 minutes by lifting the lid straight up. If you tilt it, ash falls into the dessert.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.onePot, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "dutch-oven-pancakes",
            name: "Pancake",
            cookingMethod: .dutchOven,
            mealType: .breakfast,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "One giant pancake instead of standing over the griddle. Cut it into wedges and pass it around.",
            ingredients: [
                Ingredient(name: "pancake mix", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "water or milk", amount: "1 1/2 cups", scalable: true, category: .dairy),
                Ingredient(name: "eggs", amount: "2", scalable: true, category: .meat),
                Ingredient(name: "butter", amount: "3 tablespoons", scalable: false, category: .dairy),
                Ingredient(name: "maple syrup", amount: "for serving", scalable: false, category: .pantry),
                Ingredient(name: "fresh berries", amount: "optional", scalable: false, category: .produce)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes", "whisk"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 375°F heat.",
                "Melt butter in the Dutch oven while it heats.",
                "In a bowl, whisk together pancake mix, water or milk, and eggs until smooth.",
                "Pour batter into the hot Dutch oven. Swirl to coat the bottom evenly.",
                "Cover and cook 15-20 minutes until the top is set and edges are golden.",
                "Remove lid. Let cool 2 minutes, then cut into wedges. Serve with syrup and berries."
            ],
            proTip: "Wipe your Dutch oven clean with a paper towel instead of washing it. Soap strips the seasoning and makes food stick.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.onePot, .familyFriendly],
            isPremium: false
        ),

        Recipe(
            id: "dutch-oven-pot-roast",
            name: "Pot Roast",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 20,
            cookTime: 120,
            servings: 6,
            difficulty: .medium,
            introduction: "A slow-cooked camp classic that's worth the wait. Perfect for a lazy afternoon at camp.",
            ingredients: [
                Ingredient(name: "beef chuck roast", amount: "3 lbs", scalable: true, category: .meat),
                Ingredient(name: "carrots, cut into chunks", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "potatoes, quartered", amount: "4 large", scalable: true, category: .produce),
                Ingredient(name: "onion, quartered", amount: "1 large", scalable: true, category: .produce),
                Ingredient(name: "garlic cloves", amount: "4", scalable: true, category: .produce),
                Ingredient(name: "beef broth", amount: "2 cups", scalable: false, category: .pantry),
                Ingredient(name: "tomato paste", amount: "2 tablespoons", scalable: false, category: .canned),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "dried thyme", amount: "1 teaspoon", scalable: false, category: .spices)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "tongs"],
            steps: [
                "Set up 10 coals under the Dutch oven and 20 on the lid for 375°F heat.",
                "Season roast with salt and pepper. Heat oil in the Dutch oven and brown the roast on all sides, about 8 minutes total.",
                "Remove roast. Add carrots, potatoes, onion, and garlic to the pot.",
                "Mix beef broth with tomato paste and thyme. Pour over vegetables.",
                "Place roast on top of vegetables. Cover and reduce heat to 8 coals under and 16 on top.",
                "Cook 2 hours, rotating the oven every 30 minutes. Add more coals as needed to maintain heat.",
                "Check that meat is fork-tender. If not, cook another 20-30 minutes.",
                "Let rest 10 minutes before slicing. Serve with vegetables and broth spooned over."
            ],
            proTip: "Count your briquettes before you start cooking. Running out of coals halfway through a two-hour roast is a bad day.",
            safetyNote: "Keep raw meat separate from vegetables in your cooler until cooking time.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.onePot, .winterCamping],
            isPremium: false
        ),

        // PREMIUM RECIPES (19)

        Recipe(
            id: "dutch-oven-lasagna",
            name: "Lasagna",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 25,
            cookTime: 45,
            servings: 6,
            difficulty: .medium,
            introduction: "Layered camp lasagna that tastes like you spent all day on it. Use no-boil noodles to skip a step.",
            ingredients: [
                Ingredient(name: "ground beef", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "Italian sausage", amount: "1/2 lb", scalable: true, category: .meat),
                Ingredient(name: "marinara sauce", amount: "1 jar (24 oz)", scalable: false, category: .pantry),
                Ingredient(name: "ricotta cheese", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "egg", amount: "1", scalable: false, category: .meat),
                Ingredient(name: "mozzarella cheese, shredded", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "parmesan cheese, grated", amount: "1/2 cup", scalable: false, category: .dairy),
                Ingredient(name: "no-boil lasagna noodles", amount: "9", scalable: false, category: .pantry),
                Ingredient(name: "Italian seasoning", amount: "1 teaspoon", scalable: false, category: .spices)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "parchment paper"],
            steps: [
                "Set up 10 coals under the Dutch oven and 20 on the lid for 375°F heat.",
                "Brown ground beef and sausage in the Dutch oven, about 8 minutes. Drain fat and remove meat.",
                "Mix ricotta, egg, half the mozzarella, and Italian seasoning in a bowl.",
                "Wipe out the Dutch oven and line with parchment. Spread a thin layer of marinara on the bottom.",
                "Layer 3 noodles, half the meat, half the ricotta mixture, and a third of remaining sauce. Repeat.",
                "Top with final 3 noodles, remaining sauce, and remaining mozzarella and parmesan.",
                "Cover and bake 40-45 minutes until noodles are tender and cheese is bubbly.",
                "Let rest 10 minutes before cutting. The layers need time to set."
            ],
            proTip: "Line the Dutch oven with parchment before layering. The whole lasagna lifts out clean and cleanup takes 30 seconds.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.onePot, .familyFriendly, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-biscuits-gravy",
            name: "Biscuits and Sausage Gravy",
            cookingMethod: .dutchOven,
            mealType: .breakfast,
            prepTime: 15,
            cookTime: 30,
            servings: 4,
            difficulty: .medium,
            introduction: "A hearty breakfast worth getting up early for. Make the gravy while the biscuits bake.",
            ingredients: [
                Ingredient(name: "refrigerated biscuit dough", amount: "1 tube (8 count)", scalable: false, category: .bread),
                Ingredient(name: "breakfast sausage", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "all-purpose flour", amount: "1/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "milk", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["10-inch Dutch oven with lid", "camp stove or second Dutch oven", "charcoal briquettes", "whisk"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 375°F heat.",
                "Arrange biscuits in the Dutch oven, spacing them slightly apart. Cover and bake 15-20 minutes until golden.",
                "While biscuits bake, brown sausage in a skillet over camp stove, breaking it apart, about 8 minutes.",
                "Sprinkle flour over sausage and stir for 1 minute.",
                "Slowly add milk while whisking. Cook 5-7 minutes until gravy thickens. Season with salt and pepper.",
                "When biscuits are done, split them open and ladle gravy over the top."
            ],
            proTip: "Bring gravy packets as backup. If the roux breaks or burns, you've still got breakfast covered.",
            safetyNote: nil,
            dietaryTags: [.nutFree],
            tags: [.winterCamping, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-pulled-pork",
            name: "Pulled Pork",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 15,
            cookTime: 180,
            servings: 8,
            difficulty: .advanced,
            introduction: "Low and slow camp BBQ. Start this in the afternoon and it's ready by dinner.",
            ingredients: [
                Ingredient(name: "pork shoulder", amount: "4 lbs", scalable: true, category: .meat),
                Ingredient(name: "BBQ dry rub", amount: "1/4 cup", scalable: false, category: .spices),
                Ingredient(name: "apple cider vinegar", amount: "1/2 cup", scalable: false, category: .pantry),
                Ingredient(name: "chicken broth", amount: "1 cup", scalable: false, category: .pantry),
                Ingredient(name: "BBQ sauce", amount: "1 bottle", scalable: false, category: .pantry),
                Ingredient(name: "hamburger buns", amount: "8", scalable: true, category: .bread),
                Ingredient(name: "coleslaw", amount: "for serving", scalable: false, category: .produce)
            ],
            equipment: ["14-inch Dutch oven with lid", "charcoal briquettes", "meat thermometer", "two forks"],
            steps: [
                "Rub pork shoulder all over with dry rub. Let sit 15 minutes.",
                "Set up 8 coals under the Dutch oven and 16 on the lid for 300°F heat.",
                "Place pork in the Dutch oven. Pour vinegar and broth around the sides.",
                "Cover and cook 3 hours, adding fresh coals every hour. Rotate oven every 30 minutes.",
                "Check internal temperature. When it reaches 195°F, the pork is done.",
                "Remove pork and let rest 10 minutes. Shred with two forks.",
                "Mix shredded pork with BBQ sauce. Serve on buns with coleslaw."
            ],
            proTip: "Bring a chimney starter for lighting coals. Trying to light 30+ briquettes with matches will test your patience.",
            safetyNote: "Use a meat thermometer to confirm pork reaches 195°F. Undercooked pork can cause illness.",
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.onePot, .winterCamping, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-apple-crisp",
            name: "Apple Crisp",
            cookingMethod: .dutchOven,
            mealType: .dessert,
            prepTime: 15,
            cookTime: 35,
            servings: 6,
            difficulty: .easy,
            introduction: "Warm apples and buttery topping. Works great with whatever apples you have.",
            ingredients: [
                Ingredient(name: "apples, peeled and sliced", amount: "6 cups", scalable: true, category: .produce),
                Ingredient(name: "sugar", amount: "1/2 cup", scalable: false, category: .pantry),
                Ingredient(name: "cinnamon", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "rolled oats", amount: "1 cup", scalable: false, category: .pantry),
                Ingredient(name: "all-purpose flour", amount: "3/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "brown sugar", amount: "3/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "butter, melted", amount: "1/2 cup", scalable: false, category: .dairy)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 375°F heat.",
                "Toss apple slices with sugar and cinnamon. Spread in the bottom of the Dutch oven.",
                "In a bowl, mix oats, flour, and brown sugar. Pour melted butter over and stir until crumbly.",
                "Sprinkle topping evenly over apples.",
                "Cover and bake 30-35 minutes until apples are tender and topping is golden.",
                "Let cool 5 minutes before serving. Scoop into bowls."
            ],
            proTip: "Peel apples at home and store in lemon water. They won't brown and you've got one less knife task at camp.",
            safetyNote: nil,
            dietaryTags: [.vegetarian],
            tags: [.onePot, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-chicken-rice",
            name: "Chicken and Rice",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 45,
            servings: 4,
            difficulty: .medium,
            introduction: "A complete one-pot meal. The rice absorbs all the chicken flavor as it cooks.",
            ingredients: [
                Ingredient(name: "chicken thighs, bone-in", amount: "6", scalable: true, category: .meat),
                Ingredient(name: "long-grain white rice", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "chicken broth", amount: "3 cups", scalable: false, category: .pantry),
                Ingredient(name: "onion, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "garlic, minced", amount: "2 cloves", scalable: true, category: .produce),
                Ingredient(name: "frozen peas", amount: "1 cup", scalable: true, category: .produce),
                Ingredient(name: "paprika", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "tongs"],
            steps: [
                "Set up 10 coals under the Dutch oven and 20 on the lid for 375°F heat.",
                "Season chicken with salt, pepper, and paprika. Heat oil and brown chicken on both sides, about 5 minutes per side. Remove and set aside.",
                "Add onion and garlic to the pot. Cook 3 minutes until soft.",
                "Stir in rice and cook 1 minute. Pour in chicken broth.",
                "Nestle chicken thighs into the rice. Cover and reduce heat to 8 coals under and 16 on top.",
                "Cook 30 minutes until rice is tender and chicken reaches 165°F.",
                "Stir in frozen peas. Cover and let sit 5 minutes off the coals."
            ],
            proTip: "Use bone-in chicken thighs instead of breasts. They stay moist during long cooking and add more flavor to the rice.",
            safetyNote: "Check chicken reaches 165°F with a thermometer. Keep raw chicken separate from other food in your cooler.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.onePot, .familyFriendly, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-campfire-bread",
            name: "Camp Bread",
            cookingMethod: .dutchOven,
            mealType: .snack,
            prepTime: 90,
            cookTime: 35,
            servings: 8,
            difficulty: .advanced,
            introduction: "Fresh bread at camp is easier than you think. The dough rises while you set up.",
            ingredients: [
                Ingredient(name: "all-purpose flour", amount: "3 cups", scalable: false, category: .pantry),
                Ingredient(name: "instant yeast", amount: "2 teaspoons", scalable: false, category: .pantry),
                Ingredient(name: "sugar", amount: "1 tablespoon", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1 1/2 teaspoons", scalable: false, category: .spices),
                Ingredient(name: "warm water", amount: "1 1/4 cups", scalable: false, category: .drinks),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes", "parchment paper", "clean dish towel"],
            steps: [
                "Mix flour, yeast, sugar, and salt in a bowl. Add warm water and olive oil. Stir until a shaggy dough forms.",
                "Turn dough onto a floured surface and knead 5 minutes until smooth.",
                "Place dough in a greased bowl. Cover with a damp towel and let rise 60-75 minutes until doubled.",
                "Set up 6 coals under the Dutch oven and 14 on the lid for 375°F heat. Line oven with parchment.",
                "Punch down dough and shape into a round loaf. Place in the Dutch oven.",
                "Cover and bake 30-35 minutes until the top is golden and the loaf sounds hollow when tapped.",
                "Remove and let cool 10 minutes before slicing."
            ],
            proTip: "Let dough rise in your car if it's a cold morning. The sun warms it up like a proofing box.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .dairyFree, .nutFree],
            tags: [.onePot, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-beef-stew",
            name: "Beef Stew",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 20,
            cookTime: 90,
            servings: 6,
            difficulty: .medium,
            introduction: "A warming stew that tastes better the second day. Make a big batch and reheat for lunch.",
            ingredients: [
                Ingredient(name: "beef stew meat, cubed", amount: "2 lbs", scalable: true, category: .meat),
                Ingredient(name: "carrots, chopped", amount: "3", scalable: true, category: .produce),
                Ingredient(name: "potatoes, cubed", amount: "3 large", scalable: true, category: .produce),
                Ingredient(name: "celery, chopped", amount: "2 stalks", scalable: true, category: .produce),
                Ingredient(name: "onion, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: true, category: .produce),
                Ingredient(name: "beef broth", amount: "4 cups", scalable: false, category: .pantry),
                Ingredient(name: "tomato paste", amount: "2 tablespoons", scalable: false, category: .canned),
                Ingredient(name: "all-purpose flour", amount: "1/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "dried thyme", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "bay leaf", amount: "1", scalable: false, category: .spices),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "wooden spoon"],
            steps: [
                "Set up 10 coals under the Dutch oven and 20 on the lid for 375°F heat.",
                "Toss beef cubes with flour, salt, and pepper. Heat oil and brown beef in batches, about 5 minutes per batch. Set aside.",
                "Add onion, garlic, and celery to the pot. Cook 5 minutes until soft.",
                "Stir in tomato paste and cook 1 minute. Pour in beef broth and scrape up browned bits.",
                "Return beef to the pot. Add carrots, potatoes, thyme, and bay leaf.",
                "Cover and reduce heat to 8 coals under and 16 on top. Simmer 75-90 minutes until beef is tender.",
                "Remove bay leaf. Taste and adjust seasoning."
            ],
            proTip: "Save the mesh bags from onions and potatoes. Fill them with dish soap and use as a scrubber for your Dutch oven.",
            safetyNote: nil,
            dietaryTags: [.dairyFree, .nutFree],
            tags: [.onePot, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-cinnamon-rolls",
            name: "Cinnamon Rolls",
            cookingMethod: .dutchOven,
            mealType: .breakfast,
            prepTime: 15,
            cookTime: 25,
            servings: 6,
            difficulty: .easy,
            introduction: "Use refrigerated dough for an easy camp treat. The smell will wake up the whole campground.",
            ingredients: [
                Ingredient(name: "refrigerated cinnamon roll dough", amount: "2 tubes", scalable: false, category: .bread),
                Ingredient(name: "butter, melted", amount: "2 tablespoons", scalable: false, category: .dairy)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes", "parchment paper"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 375°F heat.",
                "Line the Dutch oven with parchment paper. Brush with melted butter.",
                "Arrange cinnamon rolls in the Dutch oven, spacing slightly apart.",
                "Cover and bake 20-25 minutes until golden on top.",
                "Remove from heat. Spread the included icing over warm rolls.",
                "Let cool 5 minutes before serving."
            ],
            proTip: "Refrigerated dough keeps cold in your cooler longer than you think. It's still good after three days if it stays under 40°F.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.onePot, .familyFriendly, .campfireClassics],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-jambalaya",
            name: "Jambalaya",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 20,
            cookTime: 50,
            servings: 6,
            difficulty: .medium,
            introduction: "A spicy one-pot rice dish with sausage, chicken, and shrimp. Use whatever protein you have on hand.",
            ingredients: [
                Ingredient(name: "chicken breast, cubed", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "andouille sausage, sliced", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "shrimp, peeled", amount: "1/2 lb", scalable: true, category: .meat),
                Ingredient(name: "long-grain white rice", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "onion, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "bell pepper, chopped", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "celery, chopped", amount: "2 stalks", scalable: true, category: .produce),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: true, category: .produce),
                Ingredient(name: "diced tomatoes", amount: "1 can (14 oz)", scalable: false, category: .canned),
                Ingredient(name: "chicken broth", amount: "3 cups", scalable: false, category: .pantry),
                Ingredient(name: "Cajun seasoning", amount: "2 tablespoons", scalable: false, category: .spices),
                Ingredient(name: "vegetable oil", amount: "2 tablespoons", scalable: false, category: .pantry)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "wooden spoon"],
            steps: [
                "Set up 10 coals under the Dutch oven and 20 on the lid for 375°F heat.",
                "Heat oil and brown chicken and sausage, about 6 minutes. Remove and set aside.",
                "Add onion, bell pepper, celery, and garlic. Cook 5 minutes until soft.",
                "Stir in rice and Cajun seasoning. Cook 1 minute.",
                "Add tomatoes and broth. Bring to a simmer. Return chicken and sausage to the pot.",
                "Cover and reduce heat to 8 coals under and 16 on top. Cook 25 minutes until rice is tender.",
                "Stir in shrimp. Cover and cook 5 more minutes until shrimp are pink.",
                "Let sit 5 minutes before serving."
            ],
            proTip: "Double-bag shrimp in zip-locks and freeze solid before packing. It stays cold in your cooler and thaws when you're ready to cook.",
            safetyNote: "Keep raw shrimp and chicken separate in your cooler. Wash hands and utensils after handling raw seafood.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.onePot, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-mac-cheese",
            name: "Mac and Cheese",
            cookingMethod: .dutchOven,
            mealType: .lunch,
            prepTime: 10,
            cookTime: 25,
            servings: 6,
            difficulty: .easy,
            introduction: "Creamy baked mac and cheese without an oven. Kids and adults both love this one.",
            ingredients: [
                Ingredient(name: "elbow macaroni", amount: "1 lb", scalable: true, category: .pantry),
                Ingredient(name: "butter", amount: "4 tablespoons", scalable: false, category: .dairy),
                Ingredient(name: "all-purpose flour", amount: "1/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "milk", amount: "3 cups", scalable: true, category: .dairy),
                Ingredient(name: "sharp cheddar cheese, shredded", amount: "3 cups", scalable: true, category: .dairy),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices),
                Ingredient(name: "breadcrumbs", amount: "1/2 cup", scalable: false, category: .pantry)
            ],
            equipment: ["12-inch Dutch oven with lid", "large pot", "camp stove", "charcoal briquettes", "whisk"],
            steps: [
                "Cook macaroni in a pot of boiling water on camp stove according to package directions. Drain.",
                "Set up 8 coals under the Dutch oven and 16 on the lid for 350°F heat.",
                "Melt butter in the Dutch oven. Whisk in flour and cook 1 minute.",
                "Slowly add milk while whisking. Cook 5 minutes until sauce thickens.",
                "Remove from heat. Stir in cheese until melted. Season with salt and pepper.",
                "Add cooked macaroni and mix well. Sprinkle breadcrumbs on top.",
                "Cover and bake 15 minutes until bubbly and golden on top."
            ],
            proTip: "Shred your own cheese instead of buying pre-shredded. It melts smoother and there's no anti-caking powder.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.familyFriendly, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-pineapple-ham",
            name: "Pineapple Glazed Ham",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 60,
            servings: 8,
            difficulty: .medium,
            introduction: "A spiral ham gets a sweet glaze in the Dutch oven. Great for feeding a big group.",
            ingredients: [
                Ingredient(name: "spiral sliced ham", amount: "5 lbs", scalable: false, category: .meat),
                Ingredient(name: "pineapple rings", amount: "1 can (20 oz)", scalable: false, category: .canned),
                Ingredient(name: "brown sugar", amount: "1 cup", scalable: false, category: .pantry),
                Ingredient(name: "Dijon mustard", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "pineapple juice", amount: "1/2 cup", scalable: false, category: .drinks)
            ],
            equipment: ["14-inch Dutch oven with lid", "charcoal briquettes", "basting brush"],
            steps: [
                "Set up 8 coals under the Dutch oven and 16 on the lid for 325°F heat.",
                "Place ham in the Dutch oven. Arrange pineapple rings on top, securing with toothpicks if needed.",
                "In a bowl, mix brown sugar, mustard, and pineapple juice. Brush half the glaze over the ham.",
                "Cover and cook 45 minutes, brushing with remaining glaze every 15 minutes.",
                "Check internal temperature reaches 140°F. If not, cook another 10-15 minutes.",
                "Let rest 10 minutes before slicing."
            ],
            proTip: "Leftover ham keeps three days in a cooler. Dice it up for breakfast scrambles or sandwiches.",
            safetyNote: "Use a meat thermometer to confirm ham reaches 140°F.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.onePot, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-berry-cobbler",
            name: "Mixed Berry Cobbler",
            cookingMethod: .dutchOven,
            mealType: .dessert,
            prepTime: 10,
            cookTime: 30,
            servings: 6,
            difficulty: .easy,
            introduction: "Use whatever berries are in season or thaw a bag of frozen mixed berries. Both work great.",
            ingredients: [
                Ingredient(name: "mixed berries", amount: "6 cups", scalable: true, category: .produce),
                Ingredient(name: "sugar", amount: "1/2 cup", scalable: false, category: .pantry),
                Ingredient(name: "lemon juice", amount: "1 tablespoon", scalable: false, category: .produce),
                Ingredient(name: "all-purpose flour", amount: "1 cup", scalable: false, category: .pantry),
                Ingredient(name: "baking powder", amount: "1 1/2 teaspoons", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1/4 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "milk", amount: "1/2 cup", scalable: false, category: .dairy),
                Ingredient(name: "butter, melted", amount: "1/4 cup", scalable: false, category: .dairy)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 375°F heat.",
                "Toss berries with half the sugar and lemon juice. Spread in the Dutch oven.",
                "In a bowl, mix flour, remaining sugar, baking powder, and salt.",
                "Stir in milk and melted butter until just combined. Spoon over berries.",
                "Cover and bake 30 minutes until topping is golden and berries are bubbling.",
                "Let cool 5 minutes before serving."
            ],
            proTip: "Frozen berries work better than fresh for cobblers. They release more juice and create a thicker filling as they cook.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.onePot, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-breakfast-casserole",
            name: "Breakfast Casserole",
            cookingMethod: .dutchOven,
            mealType: .breakfast,
            prepTime: 15,
            cookTime: 40,
            servings: 6,
            difficulty: .easy,
            introduction: "Assemble this the night before and bake it in the morning. One less thing to do before coffee.",
            ingredients: [
                Ingredient(name: "frozen hash browns", amount: "4 cups", scalable: true, category: .produce),
                Ingredient(name: "breakfast sausage, cooked and crumbled", amount: "1 lb", scalable: true, category: .meat),
                Ingredient(name: "eggs", amount: "8", scalable: true, category: .meat),
                Ingredient(name: "milk", amount: "1/2 cup", scalable: false, category: .dairy),
                Ingredient(name: "shredded cheese", amount: "2 cups", scalable: true, category: .dairy),
                Ingredient(name: "bell pepper, diced", amount: "1", scalable: true, category: .produce),
                Ingredient(name: "salt and pepper", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["12-inch Dutch oven with lid", "charcoal briquettes", "parchment paper"],
            steps: [
                "Line the Dutch oven with parchment paper. Spread hash browns on the bottom.",
                "Layer cooked sausage, bell pepper, and half the cheese over hash browns.",
                "Whisk eggs with milk, salt, and pepper. Pour over the layers.",
                "Top with remaining cheese. Cover and refrigerate overnight if prepping ahead.",
                "Set up 8 coals under the Dutch oven and 16 on the lid for 350°F heat.",
                "Bake 35-40 minutes until eggs are set and cheese is bubbly.",
                "Let cool 5 minutes before slicing into wedges."
            ],
            proTip: "Brown the sausage at home and freeze it in a zip-lock. It thaws overnight in the cooler and saves you a morning step.",
            safetyNote: nil,
            dietaryTags: [.glutenFree, .nutFree],
            tags: [.onePot, .familyFriendly, .winterCamping],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-banana-bread",
            name: "Banana Bread",
            cookingMethod: .dutchOven,
            mealType: .breakfast,
            prepTime: 15,
            cookTime: 45,
            servings: 8,
            difficulty: .medium,
            introduction: "Perfect for using up brown bananas. This also works as a dessert with a scoop of ice cream.",
            ingredients: [
                Ingredient(name: "ripe bananas, mashed", amount: "3", scalable: false, category: .produce),
                Ingredient(name: "sugar", amount: "3/4 cup", scalable: false, category: .pantry),
                Ingredient(name: "eggs", amount: "2", scalable: false, category: .meat),
                Ingredient(name: "butter, melted", amount: "1/3 cup", scalable: false, category: .dairy),
                Ingredient(name: "all-purpose flour", amount: "1 3/4 cups", scalable: false, category: .pantry),
                Ingredient(name: "baking soda", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1/2 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "vanilla extract", amount: "1 teaspoon", scalable: false, category: .pantry),
                Ingredient(name: "chocolate chips", amount: "1/2 cup", scalable: false, category: .pantry)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes", "parchment paper"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 350°F heat.",
                "Line the Dutch oven with parchment paper.",
                "In a bowl, mash bananas. Stir in sugar, eggs, melted butter, and vanilla.",
                "In another bowl, mix flour, baking soda, and salt.",
                "Fold dry ingredients into banana mixture until just combined. Stir in chocolate chips.",
                "Pour batter into the Dutch oven. Smooth the top.",
                "Cover and bake 40-45 minutes until a knife inserted in the center comes out clean.",
                "Let cool 10 minutes before slicing."
            ],
            proTip: "Overripe bananas freeze perfectly. Toss them in the freezer at home and they'll be ready to use when you need them.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.onePot, .familyFriendly],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-chili-lime-chicken",
            name: "Chili Lime Chicken",
            cookingMethod: .dutchOven,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 35,
            servings: 4,
            difficulty: .easy,
            introduction: "Bright, zesty chicken that works over rice or in tacos. The lime keeps it from tasting like camp food.",
            ingredients: [
                Ingredient(name: "chicken thighs, boneless", amount: "2 lbs", scalable: true, category: .meat),
                Ingredient(name: "lime juice", amount: "1/4 cup", scalable: false, category: .produce),
                Ingredient(name: "lime zest", amount: "1 lime", scalable: false, category: .produce),
                Ingredient(name: "chili powder", amount: "2 tablespoons", scalable: false, category: .spices),
                Ingredient(name: "garlic, minced", amount: "3 cloves", scalable: true, category: .produce),
                Ingredient(name: "honey", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "olive oil", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "cilantro", amount: "optional", scalable: false, category: .produce)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes"],
            steps: [
                "Set up 8 coals under the Dutch oven and 16 on the lid for 350°F heat.",
                "Mix lime juice, lime zest, chili powder, garlic, honey, olive oil, and salt in a bowl.",
                "Add chicken thighs and toss to coat.",
                "Place chicken in the Dutch oven. Pour remaining marinade over.",
                "Cover and cook 30-35 minutes until chicken reaches 165°F.",
                "Let rest 5 minutes. Garnish with cilantro if using."
            ],
            proTip: "Marinate the chicken in a zip-lock at home. It soaks up flavor while traveling and you skip a step at camp.",
            safetyNote: "Use a thermometer to confirm chicken reaches 165°F.",
            dietaryTags: [.glutenFree, .dairyFree, .nutFree],
            tags: [.onePot, .quickMeals],
            isPremium: true
        ),

        Recipe(
            id: "dutch-oven-cowboy-coffee-cake",
            name: "Cowboy Coffee Cake",
            cookingMethod: .dutchOven,
            mealType: .breakfast,
            prepTime: 15,
            cookTime: 30,
            servings: 8,
            difficulty: .easy,
            introduction: "A sweet breakfast cake flavored with coffee and cinnamon. Pairs well with actual cowboy coffee.",
            ingredients: [
                Ingredient(name: "all-purpose flour", amount: "2 cups", scalable: false, category: .pantry),
                Ingredient(name: "sugar", amount: "1 cup", scalable: false, category: .pantry),
                Ingredient(name: "baking powder", amount: "2 teaspoons", scalable: false, category: .pantry),
                Ingredient(name: "salt", amount: "1/2 teaspoon", scalable: false, category: .spices),
                Ingredient(name: "instant coffee granules", amount: "2 tablespoons", scalable: false, category: .pantry),
                Ingredient(name: "milk", amount: "1 cup", scalable: false, category: .dairy),
                Ingredient(name: "eggs", amount: "2", scalable: false, category: .meat),
                Ingredient(name: "butter, melted", amount: "1/3 cup", scalable: false, category: .dairy),
                Ingredient(name: "brown sugar", amount: "1/2 cup", scalable: false, category: .pantry),
                Ingredient(name: "cinnamon", amount: "1 tablespoon", scalable: false, category: .spices)
            ],
            equipment: ["10-inch Dutch oven with lid", "charcoal briquettes", "parchment paper"],
            steps: [
                "Set up 6 coals under the Dutch oven and 14 on the lid for 350°F heat.",
                "Line the Dutch oven with parchment paper.",
                "Mix flour, sugar, baking powder, salt, and instant coffee in a bowl.",
                "In another bowl, whisk together milk, eggs, and melted butter.",
                "Pour wet ingredients into dry and stir until just combined.",
                "Pour batter into the Dutch oven. In a small bowl, mix brown sugar and cinnamon. Sprinkle over batter.",
                "Cover and bake 25-30 minutes until a knife inserted in the center comes out clean.",
                "Let cool 10 minutes before slicing."
            ],
            proTip: "Instant coffee packs light and never goes bad. Keep a jar in your camp box for recipes and emergency caffeine.",
            safetyNote: nil,
            dietaryTags: [.vegetarian, .nutFree],
            tags: [.onePot, .familyFriendly],
            isPremium: true
        )
    ]
}
