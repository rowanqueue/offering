using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//the actual map of the stations in the game
public class Map : MonoBehaviour {
    public static Map me;
    private void Awake()
    {
        me = this;
    }
	public void TurnOn()//turns the display on
    {
        foreach(Transform child in transform)
        {
            child.GetChild(0).gameObject.SetActive(true);
        }
    }
    public void TurnOff()//turns the display off
    {
        foreach (Transform child in transform)
        {
            child.GetChild(0).gameObject.SetActive(false);
        }
    }
}
