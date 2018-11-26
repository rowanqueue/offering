using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//a ship
public class Ship : MonoBehaviour {
    public int credits = 5000;//money

    public float maxSpeed;
    public float weaponsRating;//weapon stats
    public int totalStorage;//total storage of all rooms on the ship
    public int freeSpace;//current storage available
    public int totalPeopleStorage;//total people storage ability of all rooms on the ship
    public float engineEff;//how well the ship consumes fuel
    public int reactorTotal;//how much power the ship has
    public List<Person> crew;
    public List<Room> rooms;
    public List<Item> cargoItems;//ship's cargo for trading
    public List<Item> personalItems;//things the player owns separately

    public Station curStation;//current station the player is located at
    public Station destination;//where the player is going
    public float maxDistance;//the furthest the player can go in a single jump

    public float speedMod;//how speed is affected by the ship's engines
    public float pilotSpeedMod;//how speed is affect by a pilot
    public float engineerBonus;//discount on upgrades

    public int time = -1;//current in-game time

    //upgrade stuff
    public int storageLevel;
    public int storageCost;//cost to get to next level
    public int speedLevel;
    public int speedCost;
    public int distanceLevel;
    public int distanceCost;

    bool inTravel = false;
    Vector2 direction;
    float distanceEachTurn;//how much the player can move per turn

    bool hasBridge = false;//has to be true to be commanded
    bool hasReactor = false;//has to be true to have power
    bool hasEngine = false;//has to be true to move
    // Use this for initialization
    void Start()
    {
        storageLevel = 1;speedLevel = 1;distanceLevel = 1;
        storageCost = 50;speedCost = 75;distanceCost = 100;
        speedMod = 1.0f;
        maxSpeed = 1 / 30;
        cargoItems = Global.me.CloneItemList();
        Transform roomList = transform.GetChild(0);
        foreach (Transform child in roomList)
        {
            Room room = child.GetComponent<Room>();
            rooms.Add(room);
        }
    }

    private void FixedUpdate()
    {
        if (inTravel)
        {
            Camera.main.transform.position = new Vector3(transform.position.x, transform.position.y, -10);
            transform.GetChild(2).gameObject.SetActive(true);//display the ship
            if (Global.me.turn > time)
            {
                if (Input.GetKey(KeyCode.LeftShift) && Vector2.Distance(destination.transform.position, transform.position) > 2.0f)//fast forward
                {
                    Time.timeScale = 3.0f;
                }
                else
                {
                    Time.timeScale = 1.0f;
                }
                Travel(destination);
                Global.me.thingsHappening = true;
                Global.me.TimeStep();//make the game word continue
                Global.me.thingsHappening = false;
                time++;
            }
        }
        else
        {
            transform.GetChild(2).gameObject.SetActive(false);//turn off the ship display
        }
    }
    // Update is called once per frame
    void Update () {
        ShipStats();
        if (Input.GetKey(KeyCode.W))//move the ship even further
        {
            if (Input.GetKey(KeyCode.LeftShift))
            {
                Global.me.thingsHappening = true;
                Global.me.LargeTimeStep();
                Global.me.thingsHappening = false;
            }
            else
            {
                Global.me.thingsHappening = true;
                Global.me.TimeStep();
                Global.me.thingsHappening = false;
            }
        }
	}
    public void Travel(Station ddestination)
    {
        if(inTravel == false)//only fires when the ship isn't already moving
        {
            transform.position = curStation.transform.position;
            destination = ddestination;
            float distance = Vector2.Distance(destination.transform.position, curStation.transform.position);
            direction = (destination.transform.position - curStation.transform.position).normalized;
            curStation = null;
            Global.me.inStation = false;
            int destinationtime = (int)distance;//distance and time are practically the same without speed upgrades
            distanceEachTurn = (distance / (destinationtime*30))*speedMod*pilotSpeedMod;
            inTravel = true;
        }else
        {
            direction = (destination.transform.position - transform.position).normalized;
        }
        transform.position += (Vector3)direction.normalized * distanceEachTurn;//actually is moving the ship
        transform.GetChild(2).eulerAngles = new Vector3(0,0,Math.Angle(direction)*Mathf.Rad2Deg);//angles the ship to point towards the destination
        //Camera.main.transform.eulerAngles = new Vector3(0, 0, Math.Angle(direction) * Mathf.Rad2Deg);
        if (Vector2.Distance(destination.transform.position,transform.position) < 0.1f)//checks if the ship has arrived
        {
            while(Global.me.turn % 30 != 0)//moves the time to the next day
            {
                Global.me.TimeStep();
            }
            inTravel = false;
            curStation = destination;
            destination = null;
            Global.me.inStation = true;
        }
    }
    public void Upgrade(string part)
    {
        if(part == "Storage")
        {
            if(storageCost < credits)
            {
                credits -= Mathf.FloorToInt(storageCost*engineerBonus);
                int deltastorage = (totalStorage * (storageLevel + 1) / storageLevel) - totalStorage;
                rooms[4].storageCapacity += deltastorage;//this is necessary because the totalstorage is made of what each room has in terms of storage
                storageLevel++;
                storageCost = storageCost + (storageCost / 2);
            }
        }
        if(part == "Speed")
        {
            if(speedCost < credits)
            {
                credits -= Mathf.FloorToInt(speedCost*engineerBonus);
                speedMod = speedMod + 0.1f;
                speedLevel++;
                speedCost = (speedCost + (speedCost / 2));
            }
        }
        if (part == "Distance")
        {
            if (distanceCost < credits)
            {
                credits -= Mathf.FloorToInt(distanceCost*engineerBonus);
                maxDistance = maxDistance + 1;
                distanceLevel++;
                distanceCost = distanceCost + (distanceCost / 2);
            }
        }
    }
    void ShipStats()
    {
        foreach(Item item in cargoItems)
        {
            item.quantity = 0;
        }
        maxSpeed = 100;
        weaponsRating = 0;//resets everything
        totalStorage = 0;
        totalPeopleStorage = 0;
        reactorTotal = 0;
        engineEff = 0;
        freeSpace = 0;
        foreach(Room room in rooms)//goes through each room and adds its stats to the ship's
        {
            weaponsRating += room.weaponsRating;
            totalStorage += room.storageCapacity;
            totalPeopleStorage += room.peopleCapacity;
            reactorTotal += room.energyConsumption;
            engineEff += room.enginesRating;
            int roomTaken = 0;
            if(room.storageCapacity > 0)//has space for items
            {
                int invCounter = 0;
                while(invCounter < room.items.Count)
                {
                    cargoItems[invCounter].quantity += room.items[invCounter].quantity;//adds those items to the inventory
                    roomTaken += room.items[invCounter].quantity;
                    invCounter++;
                }
            }
            freeSpace -= roomTaken;
        }
        freeSpace = totalStorage + freeSpace;
        //crew stuff
        pilotSpeedMod = 1;
        engineerBonus = 1;
        foreach(Person person in crew)
        {
            pilotSpeedMod += ((float)person.skills[0]/10.0f)/20.0f;
            engineerBonus -= ((float)person.skills[3] / 10.0f) / 20.0f;
        }
}
    public void FillShip(List<Item> tempItems)//put new items into the ship
    {
        int totalItems = 0;
        int counter = 0;
        foreach(Item item in tempItems)
        {
            totalItems += tempItems[counter].quantity;//takes a count of all items
            counter++;
        }
        counter = 0;
        while(counter < rooms.Count)//this is trying to find rooms to store the items into
        {
            Room room = rooms[counter];
            int roomTakenUp = 0;
            if(totalItems > 0)
            {
                if (roomTakenUp < room.storageCapacity)//the room still has storage capacity
                {
                    int invCounter = 0;
                    while(invCounter < tempItems.Count)
                    {
                        if(tempItems[invCounter].quantity > 0)
                        {
                            room.items[invCounter].quantity++;//adds it to the room
                            tempItems[invCounter].quantity--;
                            roomTakenUp++;
                            totalItems--;
                        }else
                        {
                            invCounter++;
                        }
                    }
                }else
                {
                    counter++;
                }
            }else
            {
                break;//finished before going through all rooms, so finish early
            }
        }
    }
    public void EmptyShip(List<Item> tempItems)//take items out of the ship
    {
        int totalItems = 0;
        int counter = 0;
        foreach (Item item in tempItems)
        {
            totalItems += tempItems[counter].quantity;//count of all the items for checking purposes
            counter++;
        }
        counter = 0;
        while (counter < rooms.Count)//goes through all room to find the items to take
        {
            Room room = rooms[counter];
            int itemsInRoom = 0;
            foreach(Item item in room.items)
            {
                itemsInRoom += item.quantity;//counts all the items in the room
            }
            if (totalItems > 0)
            {
                if (itemsInRoom > 0)
                {
                    int invCounter = 0;
                    while (invCounter < tempItems.Count)
                    {
                        if (tempItems[invCounter].quantity > 0)
                        {
                            room.items[invCounter].quantity--;
                            tempItems[invCounter].quantity--;
                            totalItems--;
                            
                        }
                        else
                        {
                            invCounter++;
                        }
                    }
                }
                else
                {
                    counter++;
                }
            }
            else
            {
                break;//finished before checking all rooms
            }
        }
    }
}
