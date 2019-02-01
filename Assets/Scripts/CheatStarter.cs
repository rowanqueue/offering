using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheatStarter : MonoBehaviour {
    bool cheating;
    public int act;
	// Use this for initialization
	void Start () {
        act = -1;
	}
	
	// Update is called once per frame
	void Update () {
        if(Input.GetKey(KeyCode.Q) && Input.GetKey(KeyCode.P))
        {
            if (Input.GetKeyDown(KeyCode.C))
            {
                cheating = !cheating;
            }
        }
        if (cheating)
        {
            Cheat();
        }
    }
    void Cheat()
    {
        if (Input.GetKeyDown(KeyCode.Alpha0))
        {
            act = 0;
        }
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            act = 1;
        }
        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            act = 2;
        }
        if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            act = 3;
        }
        if (Input.GetKeyDown(KeyCode.Alpha4))
        {
            act = 4;
        }
        if (Input.GetKeyDown(KeyCode.Alpha5))
        {
            act = 5;
        }
        if (Input.GetKeyDown(KeyCode.Alpha6))
        {
            act = 6;
        }
    }
}
