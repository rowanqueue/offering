using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Area : MonoBehaviour {
    public StationManager manager;
    public int camerasize;
    public bool selected;
    public CircleCollider2D collider;
    public List<Station> stations;
    public List<GameObject> bodies;
	// Use this for initialization
	void Start () {
        manager = FindObjectOfType<StationManager>();
        collider = transform.GetComponent<CircleCollider2D>();
		foreach(Transform stationchild in transform.GetChild(0))
        {
            stations.Add(stationchild.GetComponent<Station>());
        }
        foreach (Transform bodychild in transform.GetChild(1))
        {
            bodies.Add(bodychild.gameObject);
        }
    }
	
	// Update is called once per frame
	void Update () {
        if(transform.name != "SOI:Sun")
        {
            if (selected)
            {
                collider.enabled = false;
            }else
            {
                collider.enabled = true;
            }
        }
        //CheckForClick();
	}
    /*void CheckForClick()
    {
        Vector2 mousepos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        if (collider.bounds.Contains(mousepos) && Input.GetMouseButtonDown(0))
        {
            manager.ChangeSOI(this);
        }
    }*/
    public void Hide()
    {
        foreach(Station station in stations)
        {
            station.transform.GetChild(0).gameObject.SetActive(false);
        }
        foreach(GameObject body in bodies)
        {
            if(body.tag == "SOI")
            {
                body.GetComponent<Area>().Hide();
            }else
            {
                body.transform.GetChild(0).gameObject.SetActive(false);
            }
        }
    }
    public void Show()
    {
        foreach (Station station in stations)
        {
            station.transform.GetChild(0).gameObject.SetActive(true);
        }
        foreach (GameObject body in bodies)
        {
            if (body.tag == "SOI")
            {
                body.GetComponent<Area>().Show();
            }
            else
            {
                body.transform.GetChild(0).gameObject.SetActive(true);
            }
        }
    }
}
