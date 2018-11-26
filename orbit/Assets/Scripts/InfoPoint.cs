using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//this class lets you hover over stations to get info about them
public class InfoPoint : MonoBehaviour {
    public StationManager manager;
    public Station station;
    public CircleCollider2D collider;
	// Use this for initialization
	void Start () {
        manager = GameObject.FindObjectOfType<StationManager>();
	}
	
	// Update is called once per frame
	void Update () {
        CheckforMouse();
	}
    void CheckforMouse()
    {
        Vector2 mousepos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        if (collider.bounds.Contains(mousepos))
        {
            manager.infoStation = station;
        }
    }
}
