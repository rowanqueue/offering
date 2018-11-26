using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//points the player can go to and interact
public class Station : MonoBehaviour {
    public Area area;
    private string nname;//have to use because name is part of MonoBehaviour
    public string Name
    {
        get
        {
            return nname;
        }
        set
        {
            nname = value;
        }
    }
    public enum stationType { Station, Planet };//important for landing because of gravity
    public string population;//flavor
    public string description;//flavor
    public Sprite image;//flavor
    public List<Item> inventory;
    public int[] production;//how much they produce a turn
    public int[] consumption;//how much they consume a turn
    public int[] prices;//how much each item costs
    public List<Person> hirePool;//the people who can be hired here
    public int dockingCost;//how much it costs to dock here(not currently used)
    int nextDayToCheck = 0;//when to check for updates
    // Use this for initialization
    void Start () {
        inventory = Global.me.CloneItemList();
        //area = transform.parent.parent.GetComponent<Area>();
        hirePool = Global.me.CreatePool(this);
        production = new int[10];
        consumption = new int[10];
        prices = new int[10];
    }
	
	// Update is called once per frame
	void Update () {
        if(nextDayToCheck<Global.me.day)//update inventory
        {
            CheckInventory();
        }
    }
    public void SetupStation(string name, string pop, string descrip,string imageName, string prod, string consum)
    {
        population = pop;
        description = descrip;
        string[] productionInfo = prod.Split(',');
        string[] consumptionInfo = consum.Split(',');
        imageName = "Images/" + imageName;
        image = Resources.Load(imageName, typeof(Sprite)) as Sprite;
        int counter = 0;
        foreach (string prodstr in productionInfo)
        {
            int prodInt = int.Parse(productionInfo[counter]);
            int conInt = int.Parse(consumptionInfo[counter]);
            production[counter] = prodInt;
            consumption[counter] = conInt;
            counter++;
        }
        GenerateSupply();

    }
    void CheckInventory()
    {
        int curday = Global.me.year * 350 + Global.me.day;
        nextDayToCheck = curday + 10;//only check every 10 days to save processing resources
        int counter = 0;
        foreach(Item item in inventory)
        {
            item.quantity += production[0]*10 - consumption[0]*5;//change quantity based on prod and consum
        }
        counter = 0;
        while(counter < prices.Length)
        {
            float net = consumption[counter] - production[counter];
            float netPercent = (net*15 / 100)+1;//the more you consum, higher the price, the more you produce, the lower the price
            float quan = inventory[counter].quantity;
            float quanPercent = (Mathf.Lerp(25, -25, (quan / (250)))/100)+1;//more you have, lower the price
            prices[counter] = Mathf.CeilToInt(inventory[counter].basePrice * netPercent * quanPercent);
            if(prices[counter] <= 0)
            {
                prices[counter] = 1;
            }
            //Debug.Log(prices[counter]);
            counter++;
        }
    }
    public void GenerateSupply()//generate an initial supply of items dependent on net production/consumption
    {
        int counter = 0;
        foreach(Item item in inventory)
        {
            int net = consumption[counter] - production[counter];
            int random = 250;
            if(net > 0)
            {
                random = Random.Range(50, 300);
            }else if (net == 0)
            {
                random = Random.Range(Random.Range(100, 200), Random.Range(201, 300));
            }else
            {
                random = Random.Range(200, 450);
            }
            random -= random * (net * Random.Range(15,50) / 100);
            inventory[counter].quantity = random;
            counter++;
        }
    }
}
