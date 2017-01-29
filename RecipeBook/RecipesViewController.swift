import UIKit

protocol RecipeCellDelegate {
    func didPressStarButton(inCell: RecipeCell, starButton: UIButton)
}

class RecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipeCellDelegate {
    
    var recipies = [Recipe]()

    @IBOutlet weak var recipesTableView: UITableView!
    
    var delegate: RecipeCellDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hardcoding recipies
        let recipe1 = Recipe(name: "Пълнени гъби с наденица и кашкавал", ingredients: [[.name:"гъби",.quantity: "600г"], [.name:"наденица", .quantity:"2 парчета"],[.name:"кашкавал", .quantity:"80г"],[.name:"масло", .quantity:"50г"],[.name:"сол", .quantity:"по вкус"],[.name:"вода", .quantity:"1/3 ч.ч"]], howToPrepare: "1. Измийте хубаво гъбите, отделете пънчетата от кошничките и нарежете пънчетата на ситно.\n" +
                "2. Наденицата нарежете на малки кубчета, лука наситнтене и запържете до златисто в растителната мазнина. Щом покафенее, добавете при него наденичките, гъбените пънчета, сол и пипер на вкус. Гответе няколко минути.\n" +
                "3.Рендосайте кашкавала.\n" +
                "4.Подредете капачетата, обърнати с дупката нагоре в намаслена тавичка и ги напълнете със запръжката.Най-отгоре сложете рендосан кашкавал.\n" +
                "5.Печете около 30 минути в средата на предварително загрята фурна на 200 градуса. Кашкавалът трябва да стане златист.\n" +
            "6.При сервиране поръсете с наситнени зелени подправки.", image: UIImage(named: "gabi")!, timeToPrepare: "25 мин", favourite: false, numberOfClicks: 0)
        let recipe2 = Recipe(name: "Мусака с кайма и заливка", ingredients: [[.name:"кайма",.quantity: "1кг"], [.name:"картофи", .quantity:"1/2кг"],[.name:"лук", .quantity:"1 глава"],[.name:"домати", .quantity:"2бр"],[.name:"магданоз", .quantity:"5 стръка"],[.name:"червен пипер", .quantity:"1 ч.л"],[.name:"черен пипер", .quantity:"1/2 ч.л"],[.name:"чубрица", .quantity:"1 ч.л"],[.name:"джоджен", .quantity:"1 ч.л"]], howToPrepare: "Картофите (1/2 кг) се измиват, обелват и нарязват на малки кубчета. Лукът (1 глава) се нарязва на ситни кубчета и се задушава в олиото (1 с.л.) до омекване. Прибавя се каймата (1 кг) и се пържи, докато се позлати. Накрая се прибавят настърганите домати (2 бр), ситно нарязаният пресен магданоз (5 стръка) и подправките, и се оставя да къкри още няколко минути. Сместа се прибавя към картофите и всичко се изсипва в тавичка. Залива се с вода почти до нивото на картофите и се пече във фурна до извирането й. Накрая се залива с разбитите яйца (2 бр), кисело мляко (200 г), сода (1 щип.) и сол (1 щип.) и се запича за още 10-15 минути, докато заливката се позлати.", image: UIImage(named: "musaka")!, timeToPrepare: "60 мин", favourite: false, numberOfClicks: 0)
        
        let recipe3 = Recipe(name: "Фаршировани яйца с авокадо", ingredients: [[.name:"яйца",.quantity: "8бр"], [.name:"авокадо", .quantity:"1бр"],[.name:"горчица", .quantity:"1 ч.л"],[.name:"лимонов сок", .quantity:"1 с.л"],[.name:"майонеза", .quantity:"1 с.л"],[.name:"черен пипер", .quantity:"1 щипка"],[.name:"копър", .quantity:"4 стръка"]], howToPrepare: "Твърдо сварените яйца (8 бр) се разполовяват по дължина и жълтъците им се отстраняват. Мекото авокадо (1 бр) се обелва, костилката му се премахва и то се поставя в блендер. Пасира се заедно с жълтъците, майонезата (1 с.л.), горчицата (1 ч.л.), лимоновия сок (1 с.л.), копъра и подправките. С получената смес се пълнят яйцата. За напълването им може да се използва шприц. Яйцата се поднасят, поръсени с черен пипер и украсени със свежи стръкчета копър (4 стръка).", image: UIImage(named: "qicaAvokado")!, timeToPrepare: "10 мин", favourite: false, numberOfClicks: 0)
        
        let recipe4 = Recipe(name: "Кюфтета по чирпански", ingredients: [[.name:"кайма",.quantity:"400г"],[.name:"картофи",.quantity:"6 бр"],[.name:"моркови",.quantity:"2 бр"],[.name:"домати",.quantity:"3 бр"],[.name:"лук",.quantity:"2 глави"],[.name:"чесън",.quantity:"4 скилидки"],[.name:"доматено пюре",.quantity:"2 с.л."],[.name:"брашно",.quantity:"2 с.л."],[.name:"червен пипер",.quantity:"1 с.л"],[.name:"черен пипер",.quantity:"на вкус"],[.name:"чубрица",.quantity:"на вкус"],[.name:"кимион",.quantity:"на вкус"],[.name:"сол",.quantity:"на вкус"],[.name:"зехтин",.quantity:"3 с.л"],[.name:"вода",.quantity:"300 мл"]], howToPrepare: "Каймата (400 г) се подправя с черен пипер, кимион, чубрица и сол на вкус. Омесва се и от нея се оформят малки кюфтета. Те се варят за 10 минути във вряща подсолена вода. Ситно нарязаният лук (2 глави) и счуканият чесън (4 скилидки) се задушават в зехтина (3 с.л.). Щом омекнат, към тях се прибавят нарязаните на малки кубчета моркови (2 бр) и предварително сварените и нарязани на едро картофи (6 бр). Ястието се разбърква и към него се добавя водата (300 мл.), брашното (2 с.л.), червеният пипер (1 с.л.), настърганите домати (3 бр) и доматеното пюре (2 с.л.). Разбърква се и се прибавят кюфтетата. Вари се до готовност. Ястието се сервира горещо, поръсено със ситно нарязан пресен магданоз и люта чушка по желание.", image: UIImage(named: "chirpanski")!, timeToPrepare: "70 мин", favourite: false, numberOfClicks: 0)
        
        let recipe5 = Recipe(name: "Пухкава сочна баница", ingredients: [[.name:"кори за баница",.quantity:"500г"], [.name:"кисело мляко",.quantity:"400г"], [.name:"яйца",.quantity:"4 бр"], [.name:"сирене",.quantity:"350-400г"], [.name:"олио",.quantity:"1/2 ч.ч"], [.name:"бакпулвер",.quantity:"10г"], [.name:"сол",.quantity:"1 ч.л."]], howToPrepare: "В купа се смесват продуктите за плънката: киселото мляко, яйцата, сиренето, олиото, бакпулвера и солта. В леко намазнена тава през две кори се слага от плънката. Подрежда се цялата баница, завършва се с кори. Нарязва се на квадрати и в разрезите се изсипва разтопеното масло. Разбиват се 2-те яйца и чашата прясно мляко и с така получената смес се залива цялата баница отгоре. Пече се в умерена фурна (180-190 С) до готовност.* Баницата доста бухва, по възможност правете я в по-дълбока тава. Тавата, в която я аз правя е 30 см в диаметър и е дълбока около 4 пръста.", image: UIImage(named: "banica")!, timeToPrepare: "60 мин", favourite: false, numberOfClicks: 0)
        
        let recipe6 = Recipe(name: "Крехки свински пържоли", ingredients: [[.name:"свински пържолки",.quantity:"4-5 бр"], [.name:"олио",.quantity:"1/3 ч.ч."], [.name:"мед",.quantity:"1 с.л."], [.name:"лимонов сок",.quantity:"1-2 с.л."], [.name:"горчица",.quantity:"1 с.л."], [.name:"тъмен соев сос",.quantity:"по вкус"], [.name:"вино",.quantity:"1/2 ч.ч."], [.name:"черен пипер",.quantity:"по вкус"], [.name:"червен пипер",.quantity:"по вкус"]], howToPrepare: "Пържолите се измиват хубаво. Маринатата се приготвя като се смесят всички продукти за нея, като е желателно първо да са меда, олиото и лимоновия сок. Бърка се до разтваряне на меда. Ако се сложи и соевия сос, няма да може да видите дали меда се е разтопил. Добавяте и останалите продукти и се бърка до хомогенна смес. Ако харесвате или не някоя от съставките, може да я увеличите или намалите. Умишлено не съм писала сол, защото соевия сос е доста солен. \nС така приготвената марината се намазват хубаво пържолите и се слагат в съд с капак в хладилника да престоят 1 час, може и повече. Остатъка от маринатата се излива в съда върху наредените пържоли. \nСлед това се нареждат в подмазнена тава, налива се малко вода и се покриват с фолио. Може да се залеят и с маринатата, в която са престояли. Пекат се на 200С градуса около 1 час под фолио. След това фолиото се маха и се допича още 15-20 минути.", image: UIImage(named: "purjola")!, timeToPrepare: "40 мин", favourite: false, numberOfClicks: 0)
        
        let recipe7 = Recipe(name: "Картофени кюфтенца с лук и сирене", ingredients: [[.name:"картофи",.quantity:"1.5кг"], [.name:"сирене",.quantity:"200-300 г"], [.name:"лук",.quantity:"1 глава"], [.name:"яйца",.quantity:"3 бр"], [.name:"чубрица",.quantity:"по вкус"], [.name:"сол",.quantity:"по вкус"], [.name:"майорана",.quantity:"по вкус"], [.name:"черен пипер",.quantity:"по вкус"]], howToPrepare: "Обелват се картофите и се сваряват в леко подсолена вода с 2-3 скилидки чесън - само за лек аромат. След това се намачкват или се пасират, прибавят се натрошеното сирене, настъргания лук и подправките. Омесва се всичко и се прибавят 1 бр. яйце и 1 бр. жълтък и сместа се омесва добре. Оставя се да престои 1 час. Правят се топки и се овалват в брашно, а после в добре разбития белтък и другото яйце. Пържат се в сгорещено олио или се пекат в намаслена тава в умерена фурна.", image: UIImage(named: "kuftetaKartof")!, timeToPrepare: "35 мин", favourite: false, numberOfClicks: 0)
        
        recipies.append(recipe1)
        recipies.append(recipe2)
        recipies.append(recipe3)
        recipies.append(recipe4)
        recipies.append(recipe5)
        recipies.append(recipe6)
        recipies.append(recipe7)
        
        
        //sort items by name
        recipies.sort { (rec1: Recipe, rec2: Recipe) -> Bool in
            
            if rec2.numberOfClicks == rec2.numberOfClicks {
                return rec2.name > rec1.name
            }
            else{
                return rec2.numberOfClicks > rec1.numberOfClicks
            }
            
        }
        
        recipesTableView.delegate = self
        recipesTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let recipeCell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeCell {
            
            let cellInformation = recipies[indexPath.row]
            
            recipeCell.updateCellInformation(recipe: cellInformation)
            
            return recipeCell
        }
        else {
            return UITableViewCell()

        }
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentlySelectedRecipe = recipies[indexPath.row]
        recipies[indexPath.row].numberOfClicks += 1
        
        performSegue(withIdentifier: "RecipeDetailViewController", sender: currentlySelectedRecipe)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? RecipeDetailViewController {
            
            if let recipe = sender as? Recipe {
                destination.recipe = recipe
            }
        }
    }
    
    
    func didPressStarButton(inCell: RecipeCell, starButton: UIButton) {
        print("a button was pressed")
    }

    
}


