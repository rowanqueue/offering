using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[System.Serializable]
public class Item{
    public string name;
    public int mass = 1; //affects ships when going on planet
    public int volume = 1;//how much room it takes up
    public int basePrice;//the base price to change for local variations
    public int quantity = 0;//how much this instance has, whether it be on a ship or a station

    public Item(string name, int basePrice, int mass, int volume, int quantity)
    {
        this.name = name;
        this.mass = mass;
        this.volume = volume;
        this.basePrice = basePrice;
        this.quantity = quantity;
    }

    // Use this for initialization
    public Item Clone()
    {
        return new Item(name, basePrice, mass, volume, quantity);
    }
}
