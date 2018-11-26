using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class Global : MonoBehaviourSingleton<Global> {
    public static Global me;
    public Ship ship; //player's ship
    public bool inStation = true;
    public int year = 0; //year is 350days
    public int day = 1; //all this time stuff is important for the stations to produce/consume, passenger contracts, etc.
    public int turn = 0; //30 turns to a day
    public List<Item> items;
    public bool thingsHappening;//this way the game knows a turn is passing
    public Station[] stations;
    public Orbit[] orbits;
    public string itemsInfo;//path of item.txt
    public string stationsInfo;//path of stars.txt
    public string nameList;//path of namelist.txt
    // Use this for initialization
    private void Awake()
    {
        me = this;
        Debug.Log(Time.time+"S");
        CreateListofItems();
    }
    void Start () {
        stations = FindObjectsOfType<Station>();
        orbits = FindObjectsOfType<Orbit>();
        BuildStations();
	}
	
	// Update is called once per frame
    public void TimeStep()
    {
        turn++;
        if(turn % 30 == 0)//because 30 turns to a day
        {
            day++;
        }
        /*if (thingsHappening)
        {
            foreach(Orbit orbit in orbits)
            {
                orbit.Move();
            }
        }*/
        if(day % 350 == 0)
        {
            year++;
            day -= 350;
        }
    }
    public void LargeTimeStep()//for fastforwarding
    {
        turn += 30;//moves a whole day
        day++;
        if (day % 350 == 0)
        {
            year++;
            day -= 350;
        }
        /*if (thingsHappening)
        {
            foreach (Orbit orbit in orbits)
            {
                float num = orbit.angvelocity;
                orbit.angvelocity = orbit.angvelocity * 30;
                orbit.Move();
                orbit.angvelocity = num;
            }
        }*/
    }
    void BuildStations()
    {
        using (StreamReader reader = new StreamReader("Assets/Resources/Text/" + stationsInfo))
        {
            string lineString;
            bool finished = false;
            while (finished == false)
            {
                lineString = reader.ReadLine();
                if (lineString == "end")
                {
                    finished = true;
                    continue;
                }
                int counter = 0;
                string[] line = lineString.Split(':');
                Station chosenStation = null;
                foreach (Station station in stations)
                {
                    if (line[0] == station.name)
                    {
                        chosenStation = station;
                    }
                }
                if (chosenStation != null)
                {
                    chosenStation.SetupStation(line[0], line[2], line[3], line[4], line[5], line[6]);
                }
                counter++;
            }
        }
    }
    void CreateListofItems()//makes the list of all items that all other inventories are cloned from
    {
        items = new List<Item>();
        using(StreamReader reader = new StreamReader("Assets/Resources/Text/" + itemsInfo))
        {
            string lineString;
            bool finished = false;
            while (finished == false)
            {
                lineString = reader.ReadLine();
                if(lineString == "end")
                {
                    finished = true;
                    continue;
                }
                string[] line = lineString.Split(':');
                int counter = 0;
                if (line[0] == "Name")
                {
                    counter++;
                    continue;
                }
                Item item = new Item(line[0], int.Parse(line[1]), int.Parse(line[2]), int.Parse(line[3]), 0);
                counter++;
                items.Add(item);
            }
        }
    }
    public List<Item> CloneItemList()//clones the item list to make an inventory
    {
        List<Item> newItems = new List<Item>();
        foreach(Item item in items)
        {
            Item newItem = item.Clone();
            newItems.Add(newItem);
        }
        return newItems;
    }
    public void Name(Person person)
    {
        using (StreamReader reader = new StreamReader("Assets/Resources/Text/" + nameList))
        {
            string[] lines = reader.ReadToEnd().Split('\n');
            string[] firstnames = lines[0].Split(',');
            string[] lastnames = lines[1].Split(',');
            person.Name = firstnames[Random.Range(0, firstnames.Length)] + " " + lastnames[Random.Range(0, lastnames.Length)];
        }
    }
    public List<Person> CreatePool(Station station)//makes the pool of people avaiable on a station
    {
        List<Person> pool = new List<Person>();
        for(int size = Random.Range(1, 5); size > 0; size--)
        {
            GameObject personObj = Instantiate(Resources.Load("Person"), station.transform) as GameObject;
            Person person = personObj.GetComponent<Person>();
            person.origin = station.name;
            pool.Add(person);
        }
        return pool;
    }
}
