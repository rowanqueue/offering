using System.Collections;
using System.Linq;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StationManager : MonoBehaviour {
    public Station station;//station being display
    public Ship ship;//player's ship
    public Area area;
    //display stuff
    public Text stationName;
    public Text sceneName;
    public Text date;
    public Text credits;
    public Text soiName;
    public Transform buyScreen;
    public Transform sellScreen;
    public Transform infoScreen;
    public Transform shipyardScreen;
    public Transform crewScreen;
    public Transform barScreen;
    public Transform travelScreen;
    public GameObject travelLines;//starlines display
    public Station infoStation;//station being hovered over on the map

    public int whichMenu;//which screen the player is on

    public CameraDragger dragger;

    bool inStation = false;
    List<Item> tempItems;
	// Use this for initialization
	void Start () {
        whichMenu = 4;//start the player at the bar
        tempItems = Global.me.CloneItemList();
    }
	
	// Update is called once per frame
	void Update () {
        if (Global.me.inStation)
        {
            if(station == null)//make sure this has the right info
            {
                station = Global.me.ship.curStation;
                ship = Global.me.ship;
                inStation = Global.me.inStation;
                //area = station.area;
                //area.selected = true;
                //Camera.main.transform.position = new Vector3(area.transform.position.x, area.transform.position.y, Camera.main.transform.position.z);
                //Camera.main.orthographicSize = area.camerasize;
            }
        }else if(station != null)
        {
            station = null;
            ship = null;
            inStation = Global.me.inStation;
            //area.selected = false;
            //area = null;
        }
        if (inStation)
        {
            //all this is making the header
            stationName.text = station.name;
            credits.text = ship.credits + "c";
            sceneName.text = whichMenu.ToString();
            date.text = "Day " + Global.me.day + ", " + (2332 + Global.me.year);
            //all this is resetting the screens
            buyScreen.gameObject.SetActive(false);
            sellScreen.gameObject.SetActive(false);
            shipyardScreen.gameObject.SetActive(false);
            crewScreen.gameObject.SetActive(false);
            barScreen.gameObject.SetActive(false);
            infoScreen.gameObject.SetActive(false);
            travelScreen.gameObject.SetActive(false);
            //this is turning on the screen you are on
            if (whichMenu == 0)
            {
                BuyMenu();
            }
            else if (whichMenu == 1)
            {
                SellMenu();
            }
            else if(whichMenu == 2)
            {
                ShipyardMenu();
            }
            else if(whichMenu == 3)
            {
                CrewMenu();
            }
            else if(whichMenu == 4)
            {
                BarMenu();
            }
            else if(whichMenu == 6)
            {
                //soiname.text = area.name;
                travelScreen.gameObject.SetActive(true);
                Map.me.TurnOn();//turns on the display of the map
                travelLines.SetActive(true);
                dragger.resetCamera = ship.transform.position;
                dragger.resetCamera.z = -10;
                dragger.beingUsed = true;
                //area.Show();
                if (infoStation != null)
                {
                    Info();
                    if (Input.GetMouseButtonDown(0) && infoStation != station)//clicked on a different station
                    {
                        //Debug.Log(Vector2.Distance(ship.transform.position, infostation.transform.position));
                        if (Mathf.FloorToInt(Vector2.Distance(ship.transform.position,infoStation.transform.position)) <= ship.maxDistance)//station is close enough
                        {
                            ship.Travel(infoStation);
                        }
                    }
                }
                infoStation = null;
            }
            if(whichMenu != 6)//since all of the above is a bunch of else if statements
            {
                dragger.beingUsed = false;
                travelLines.SetActive(false);
                Map.me.TurnOff();
                //soiname.text = "";
                //area.Hide();
            }
        }else
        {
            stationName.text = "";
            sceneName.text = "";
            credits.text = "";
            date.text = "Day " + Global.me.day + ", " + (2332 + Global.me.year);
        }
       
	}
    void Info()
    {
        infoScreen.gameObject.SetActive(true);
        infoScreen.GetChild(0).GetComponent<Text>().text = infoStation.name;
        infoScreen.GetChild(1).GetComponent<Text>().text = "Pop: "+infoStation.population;
        float distance = Vector2.Distance(infoStation.transform.position, station.transform.position);
        infoScreen.GetChild(2).GetComponent<Text>().text = Mathf.FloorToInt(distance*(1/ship.speedMod)*(1/ship.pilotSpeedMod)) + " days away";
        int counter = 0;
        foreach(Item item in infoStation.inventory)
        {
            Transform line = infoScreen.GetChild(counter + 4);
            line.GetChild(0).GetComponent<Text>().text = item.name;
            line.GetChild(1).GetComponent<Text>().text = infoStation.prices[counter]+"c";
            int difference = infoStation.prices[counter] - station.prices[counter];//displays difference in prices to help the player find good deals
            line.GetChild(2).GetComponent<Text>().text = difference + "c";
            counter++;
        }
    }
    /*public void ChangeSOI(Area soi)
    {
        area.selected = false;
        area = soi;
        area.selected = true;
        //Camera.main.transform.position = new Vector3(area.transform.position.x, area.transform.position.y, Camera.main.transform.position.z);
        Camera.main.orthographicSize = area.camerasize;
    }*/
    void BarMenu()//all flavor, all day
    {
        barScreen.gameObject.SetActive(true);
        barScreen.GetChild(1).GetComponent<Image>().sprite = station.image;
        barScreen.GetChild(2).GetComponent<Text>().text = station.description;
        barScreen.GetChild(3).GetComponent<Text>().text = station.name;
        barScreen.GetChild(4).GetComponent<Text>().text = station.population;
    }
    void ShipyardMenu()//upgrade your ship
    {
        shipyardScreen.gameObject.SetActive(true);
        DisplayShipStat(shipyardScreen.GetChild(1));
        DisplayShipStat(shipyardScreen.GetChild(2));
        DisplayShipStat(shipyardScreen.GetChild(3));
    }
    void DisplayShipStat(Transform t)
    {
        float current = 0;
        float next = 0;
        int cost = 0;
        //is modular to deal with different type of upgrades
        if(t.name == "Storage")
        {
            int level = ship.storageLevel;
            current = ship.totalStorage;
            next = ship.totalStorage * (level + 1) / level;
            cost = Mathf.FloorToInt(ship.storageCost*ship.engineerBonus);
        }
        if (t.name == "Speed")
        {
            int level = ship.speedLevel;
            current = ship.speedMod;
            next = ship.speedMod + 0.1f;
            cost = Mathf.FloorToInt(ship.speedCost * ship.engineerBonus);
        }
        if (t.name == "Distance")
        {
            int level = ship.distanceLevel;
            current = ship.maxDistance;
            next = ship.maxDistance + 1;
            cost = Mathf.FloorToInt(ship.distanceCost * ship.engineerBonus);
        }
        t.GetChild(0).GetComponent<Text>().text = current.ToString();
        t.GetChild(1).GetComponent<Text>().text = cost + "c";
        t.GetChild(2).GetComponent<Text>().text = next.ToString();
    }
    public void ShipUpgrade(string part)//is used by the buttons to call the ship's function
    {
        ship.Upgrade(part);
    }
    void CrewMenu()//check out your crew and hire more/different crew
    {
        crewScreen.gameObject.SetActive(true);
        Transform myCrew = crewScreen.GetChild(0);
        int counter = 0;
        foreach(Transform child in myCrew)
        {
            child.gameObject.SetActive(false);
        }
        foreach(Person person in ship.crew)
        {
            myCrew.GetChild(counter).gameObject.SetActive(true);
            DisplayPerson(myCrew.GetChild(counter), person);
            counter++;
        }
        Transform pool = crewScreen.GetChild(2);
        counter = 0;
        foreach(Transform child in pool)
        {
            child.gameObject.SetActive(false);
        }
        foreach (Person person in station.hirePool)
        {
            pool.GetChild(counter).gameObject.SetActive(true);
            DisplayPerson(pool.GetChild(counter), person);
            counter++;
        }
    }
    void DisplayPerson(Transform t,Person person)
    {
        t.GetChild(0).GetComponent<Text>().text = person.Name;
        Transform skills = t.GetChild(1);
        int counter = 0;
        foreach(Transform skill in skills)
        {
            skill.GetComponent<Text>().text = person.skills[counter].ToString();
            counter++;
        }
        t.GetChild(2).GetComponent<Text>().text = "Age: " + person.age;
        t.GetChild(3).GetComponent<Text>().text = "Wage " + person.credits;
    }
    public void HirePerson(int index)//positive hire, negative fire
    {
        if(index > 0)
        {
            index = Mathf.Abs(index) - 1 ;
            Person person = station.hirePool[index];
            if (ship.credits > person.credits && ship.crew.Count <= 4)
            {
                ship.credits -= person.credits;
                ship.crew.Add(person);
                station.hirePool.Remove(person);
            }
        }else
        {
            index = Mathf.Abs(index)-1;
            ship.crew.Remove(ship.crew[Mathf.Abs(index)]);
        }
    }
    void BuyMenu()//for buying stuff
    {
        buyScreen.gameObject.SetActive(true);
        int totalCost = 0;
        int counter = 0;
        foreach(Item item in tempItems)
        {
            totalCost += item.quantity * station.prices[counter];
            counter++;
        }
        buyScreen.GetChild(1).GetComponent<Text>().text = "Total: " + totalCost+"c";
        buyScreen.GetChild(2).GetComponent<Text>().text = "Free Space: " + ship.freeSpace;
        counter = 0;
        foreach(Item item in station.inventory)
        {
            Transform line = buyScreen.GetChild(counter+4);
            line.GetChild(0).GetComponent<Text>().text = item.name;
            line.GetChild(1).GetComponent<Text>().text = station.prices[counter] + "c";
            line.GetChild(2).GetComponent<Text>().text = item.quantity.ToString();
            line.GetChild(3).GetComponent<Text>().text = ship.cargoItems[counter].quantity.ToString();
            line.GetChild(4).GetComponent<Text>().text = tempItems[counter].quantity.ToString();
            line.GetChild(5).GetComponent<Text>().text = (station.prices[counter] * tempItems[counter].quantity) + "c";
            counter++;
        }

        
    }
    public void tempbuy(int item)//this is basically putting the item in your 'shopping cart'
    {   //item is positive if adding, negative if removing
        //item is also the index of whatever it actually is +1 (since there is no -0)
        int original = 0;
        if(item > 0)//add
        {
            item--;//convert it to actual place
            original = tempItems[item].quantity;//size of temp buy before adding
            tempItems[item].quantity++;//actually adding
            if (Input.GetKey(KeyCode.LeftShift)){//bulk buying
                tempItems[item].quantity += 4;
            }
        }else
        {
            item++;
            item = Mathf.Abs(item);
            original = tempItems[item].quantity;
            tempItems[item].quantity--;
            if (Input.GetKey(KeyCode.LeftShift))
            {
                tempItems[item].quantity -= 4;
            }
        }
        int totalItems = 0;
        int totalCost = 0;
        int nitemCounter = 0;
        foreach (Item nitem in tempItems)
        {
            totalItems += nitem.quantity;
            totalCost += station.prices[nitemCounter]*nitem.quantity;
            nitemCounter++;
        }
        if (tempItems[item].quantity < 0 || totalItems > ship.freeSpace || totalCost > ship.credits)//you're either less than 0 or more than freespace or can't afford
        {
            tempItems[item].quantity = original;
        }
    }
    public void permanentbuy()//actually put your 'shopping cart' into your ship
    {
        //we already know that temp items is able to be bought, because you could put it in your shopping cart
        int totalCost = 0;
        int counter = 0;
        foreach (Item item in tempItems)
        {
            totalCost += item.quantity * station.prices[counter];
            station.inventory[counter].quantity -= item.quantity;
            counter++;
        }
        ship.FillShip(tempItems);//actually putting the items in
        ship.credits -= totalCost;
        tempItems = Global.me.CloneItemList();//reset the 'shopping cart'
    }
    void SellMenu()
    {
        sellScreen.gameObject.SetActive(true);
        int totalProfit = 0;
        int counter = 0;
        foreach (Item item in tempItems)
        {
            totalProfit += item.quantity * station.prices[counter];
            counter++;
        }
        sellScreen.GetChild(1).GetComponent<Text>().text = "Total: " + totalProfit + "c";
        sellScreen.GetChild(2).GetComponent<Text>().text = "Free Space: " + ship.freeSpace;
        counter = 0;
        foreach (Item item in station.inventory)
        {
            Transform line = sellScreen.GetChild(counter + 4);
            line.GetChild(0).GetComponent<Text>().text = item.name;
            line.GetChild(1).GetComponent<Text>().text = station.prices[counter] + "c";
            line.GetChild(2).GetComponent<Text>().text = ship.cargoItems[counter].quantity.ToString();
            line.GetChild(3).GetComponent<Text>().text = tempItems[counter].quantity.ToString();
            line.GetChild(4).GetComponent<Text>().text = (station.prices[counter] * tempItems[counter].quantity) + "c";
            counter++;
        }
    }
    public void tempsell(int item)//still a 'shopping cart' but now its for selling
    {
        //works just like tempbuy
        int original = 0;
        if (item > 0)
        {
            item--;
            original = tempItems[item].quantity;
            tempItems[item].quantity++;
            if (Input.GetKey(KeyCode.LeftShift))
            {
                tempItems[item].quantity += 4;
            }
        }
        else
        {
            item++;
            item = Mathf.Abs(item);
            original = tempItems[item].quantity;
            tempItems[Mathf.Abs(item)].quantity--;
            if (Input.GetKey(KeyCode.LeftShift))
            {
                tempItems[item].quantity -= 4;
            }
        }
        if(ship.cargoItems[item].quantity < tempItems[Mathf.Abs(item)].quantity || tempItems[Mathf.Abs(item)].quantity < 0)//you don't actually have the items to sell...
        {
            tempItems[item].quantity = original;
        }
    }
    public void permanentsell()//clear your selling 'shopping cart'
    {
        int totalProfit = 0;
        int counter = 0;
        foreach (Item item in tempItems)
        {
            totalProfit += item.quantity * station.prices[counter];
            station.inventory[counter].quantity += item.quantity;
            counter++;
        }
        ship.EmptyShip(tempItems);//take the actual items from your ship
        ship.credits += totalProfit;
        tempItems = Global.me.CloneItemList();
    }
    public void soiissun()
    {
        Camera.main.orthographicSize = 70;
    }
    public void setmenu(int menu)
    {
        whichMenu = menu;
    }
}
