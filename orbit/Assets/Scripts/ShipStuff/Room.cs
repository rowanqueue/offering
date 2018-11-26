using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//the individual rooms on a ship
public class Room : MonoBehaviour {
    public string function; //basically the name
    public Vector2 dimensions;//size
    public int storageCapacity;//how many items can fit inside
    public int peopleCapacity;//how many people can fit inside
    public int energyConsumption;//how much power it takes to run(may be negative if it produces energy)
    public int weaponsRating;//how powerful its weapons are(may be 0)
    public int enginesRating;//how powerful its engines are(may be 0)
    public List<Item> items;
	// Use this for initialization
	void Start () {
        items = Global.me.CloneItemList();
    }
}
